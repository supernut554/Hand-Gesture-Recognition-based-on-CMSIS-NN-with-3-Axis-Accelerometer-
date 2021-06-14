@settings {
  font-size: 100;
}
Welcome to Hand-Gesture-Recognition-based-on-CMSIS-NN-with-3-Axis-Accelerometer Project. This project will receive a repetetive motion and recognise it as a certain hand gesture and display out as word.


TWO Major Hardwares Utilised:
1. STM32F446RE (Nucleo-F446RE) will be used as the embedded board for this application
2. ADXL-337 accelerometer will be connect to Nucleo board to provide 12-bit ADC signal at each axis data. It consists of 3 Data-Pins (X_OUT, Y_OUT and Z_OUT)


Software of Website utilised:
1. https://www.edgeimpulse.com/ will be used to collect train/test data, generate spectral feature block code, train and validate Neural Network and export the
generated code as Cube.MX CMSIS Pack.
2. STM32 Cube IDE 1.6.0


Contents of steps:
A. Environment setup (For Windows)
B. Data Forwarding 3-axis RAW data for data collection on Edge Impulse Website (Ignore if you are using our trained model/code)
C. Edge Impulse Website (Ignore if you are using our trained model/code)
D. Deployment Stage


Steps by Steps Guide:
A. Environment setup (For Windows)
1. First, install STM32CubeIDE 1.6.0 for Windows 64-bits from https://www.st.com/en/development-tools/stm32cubeide.html and STlink Driver from https://www.st.com/en/development-tools/stsw-link009.html so that your Nucleo Board can be detected.
 
2. Once STM32 Cube IDE are successfully setup. You can try to build an empty code and flash into Nucleo Board to verify your board are connected successfully.

3. Next, make sure you have created an account in Edge Impulse website (https://www.edgeimpulse.com/) before you start to collect data and train your model on the website. Since data are required to be forwarded from your accelerometer on Nucleo board, through USB connected to PC and transfer to Edge Impulse Website, therefore you need to set up Edge-Impulse Daemon, which is the CLI provided by Edge Impulse that helps to forwarder data from board to their Website. The extensive explaination on how to setup Edge-Impulse Daemon can be read here: https://docs.edgeimpulse.com/docs/cli-installation. 
i. Install Python 3 (Python 3.8) on your host computer(Please directly install from Microsoft Store)
ii. Install Node.js v14 or higher on your host computer.
For Windows users, install the Additional Node.js tools when prompted. You may skip this setup if you have Visual Studio 2015 or more.
Finally, install the CLI tools via:
npm install -g edge-impulse-cli --force
You should now have the tools available in your PATH.
Once you restart the terminal, key in "edge-impulse-daemon" in CMD terminal. Once you are able to proceed without error, Edge-impulse CLI Environment are configured successfully. You may refer to https://docs.edgeimpulse.com/docs/cli-daemon if you have any problems. After this, close your terminal and proceed to following steps.


B. Data Forwarding 3-axis RAW data for data collection on Edge Impulse Website (Ignore if you are using our trained model/code)
1. Launch STM32 Cube IDE 1.6.0, Launch the default Workspace. From File> Open Projects from File Systems... , it will pop out a window so that you can put the path to downloaded code and click Finish. From Project Explorer, Find 0603_Microp > Core > Src > main.cpp and double click main.cpp. From the main.cpp, we have provided coding for 2 purposes: data forwarding and deployment. For now, we will comment out the "deployment section" code and only using "data forwarding" section.

2. From 0603_Microp > Core > Src > main.cpp, please comment out the code from line 80-96, 145-174, 184-224 for "data forwarding" code usage. You can look for ///* and //*/. 

3. While keeping the rest of the code especialy line 227-246 and excluding the lines mentioned in instruction 2, compile the code (indicate by a hammer icon) and flash the code (debugging icon) into Nucleo Board.

4. Once it show "Download verified successfully", do not forget to press hard reset on Nucleo Board for the code to take effect. Then, open CMD terminal from Windows, key in "edge-impulse-data-forwarder". For the first time You may need to provide your credential such as email and password for Edge Impulse Website, then it will detected 3 types of data to be forwarder. Key in "rawX,rawY,rawZ" so that the 3 ADC signal can be forwarded to Edge Impulse website and those raw data can be named as rawX, rawY and rawZ respectively.

5. Once it shows "You may start to build your machine learning project in Edge Impulse", that means your data are being forwarded.


C. Edge Impulse Website (Ignore if you are using our trained model/code)
1. From Edge Impulse Website, go to "Data Acquisition" Tab, you can start to sample as much dataset as you can. You can label the data and indicate how long do you want to sample. 

2. Once setisfied with amount of dataset collected, you may proceed to create 3 impulses which is the spectral analysis, detection model, and K mean-anormalies block.

3. For Spectral Analysis block, Low pass filter with cut-off frequency of 3Hz and 6th order Butterworth filter is applied to filter out the unwanted frequencies of the repetitive patterns of the signal. In this process, the raw signal is first scaled up to set scale axes which is 1 in this project and offset by its mean value. The Butterworth filter is then applied and the root mean square (RMS) of the filter output is added to the feature lists. Then, the spectral power configuration is set with Fast Fourier Transform (FFT) length of 64, 3 peaks and 5 power edges. At the end of the process, there will be 33 features generated in total for the input signal of the 3-axis accelerometer. The number of generated features per axis listed as below:
·         1 value for the RMS of the filter output.
·         6 values of the power peaks, which is frequency and height for each peak.
·         4 values for power buckets (Number of Power Edges -1)
Once completed configuration, click save parameter.

4. For Detection model block, the generated 33 features will be used as the input layer of the NN classifier. The number of epochs to train the neural network is set to be 150, which means the learning algorithm will work throughout the entire training dataset for 150 times. Then, the learning rate of how quickly the model is adapted to the problem is set to be 0.0001 while the confidence rate, which is the threshold score to trust the network is set to be 80%. For the neural network architecture, it consist of 1 33 features input layer, 2 hidden layer which consists of 20 neuron and 10 neurons respectively and 1 output layer to produce the final results consisting 7 features, which are ‘chestfrontback’, ‘please’, ‘restroom’, ‘slowdown’, ‘thankyou’, ‘updown’ and ‘yes'.

5.Once completed configuration, click start training. THe training process log will be shown and take several mintues based on the amount of dataset. Note that all item labelled as training dataset will be trained, if you wish to exclude some dataset not to be train, you may place it to test dataset. Once completed training, you may proceed to K means-anormalies block.

6. For K means-anormalies block, 32 cluster are set with minimum score of 0.30, which means the value above this score will be tagged as anomaly. Once completed configuration, click start training again.

7. Once you have 3 blocks and trained model, you can do a live classification which using our previous test data set or live demo to test the trained model. Once satisfied with the performance, you may proceed to deploy the code for implementation.

8. At "Deployment" tab, choose "Cube.MS CMSIS-Pack" and click "Build", the CMSIS-pack are downloaded and a detailed step-by-step instruction will be prompted.


D. Deployment Stage
1. From 0603_Microp > Core > Src > main.cpp , comment out code at line 227-246 since we are in the deployment stage. Now, we should use the code from line 80-96, 145-174, 184-224. Again, build and flash the code into Nucleo Board for deployment.

2. Once it show "Download verified successfully", do not forget to press hard reset on Nucleo Board for the code to take effect. Then, open CMD terminal from Windows, key in "edge-impulse-run-impulse --raw". There is 1 feature of using our code, when blue user button is pressed once, the user LED will be lighted up. This means that it is in standby mode where no inferencing will be performed. Once the blue user button is pressed again, the user LED will be off and this means that continuous motion detection will be started once every 5 second, from here you may start to perform 7 gesture that we have trained which are : ‘chestfrontback’, ‘please’, ‘restroom’, ‘slowdown’, ‘thankyou’, ‘updown’ and ‘yes'.

More Info:
1. Action to be recognised: 
https://www.youtube.com/watch?v=0FcwzMq4iWg
https://www.youtube.com/watch?v=Pg-8ZmQIEJE
2. Edge Impulse CLI installation: 
https://docs.edgeimpulse.com/docs/cli-installation
3. Edge Impulse Data Forwarder:
https://docs.edgeimpulse.com/docs/cli-data-forwarder
4. Deployment on Edge Impulse CLI:
https://docs.edgeimpulse.com/docs/cli-run-impulse

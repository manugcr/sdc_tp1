#include <ESP8266WiFi.h>

void testAt80MHz() 
{
    unsigned long startTime, endTime;
    startTime = micros();
    
    for (int i = 0; i < 1000; i++) 
        float result = sqrt(i * 1.0);; 
    
    endTime = micros();
    Serial.print("Time taken at 80MHz: ");
    Serial.print(endTime - startTime);
    Serial.println(" microseconds");
}

void testAt160MHz() 
{
    unsigned long startTime, endTime;
    startTime = micros();
    
    for (int i = 0; i < 1000; i++)
        float result = sqrt(i * 1.0);
    
    endTime = micros();
    Serial.print("Time taken at 160MHz: ");
    Serial.print(endTime - startTime);
    Serial.println(" microseconds");
}

void setup() 
{
    Serial.begin(115200);
    delay(1000);
    
    Serial.println("Testing Time Difference between 80MHz and 160MHz");
}

void loop() 
{
    int cpuFreq = ESP.getCpuFreqMHz();
    
    if (cpuFreq == 80) 
        testAt80MHz();
    else if (cpuFreq == 160) 
        testAt160MHz();
    
    // Wait for some time before next iteration
    delay(5000);
}

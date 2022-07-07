//+------------------------------------------------------------------+
//|                                              ExportChartData.mq4 |
//|                                     Copyright 2022, SlaveryGames |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, SlaveryGames"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property show_inputs

// Exports all candles that are loaded on the chart into JSON file
// [
//    {
//        "Open" : 1816.34,
//        "Close" : 1816.64,
//        "High" : 1816.75,
//        "Low" : 1816.34,
//        "DateTime" : "2021.12.31 02:10:00"
//    },
// ]

input string Filename = "Candles.json"; // Output file name

void OnStart()
{
   string json = "[\n";
   
   for(int i = Bars - 1; i >= 0; i--)
   {
      json += "    {\n";
      
      json += "        \"Open\" : " + Open[i] + ",\n";
      json += "        \"Close\" : " + Close[i] + ",\n";
      json += "        \"High\" : " + High[i] + ",\n";
      json += "        \"Low\" : " + Low[i] + ",\n";
      json += "        \"DateTime\" : \"" + TimeToStr(Time[i],TIME_DATE|TIME_SECONDS) + "\"\n";
      
      json += "    },\n";
   }
   
   json += "\n]";
   
   int fileHandle = FileOpen(Filename,FILE_WRITE|FILE_TXT);
   FileWriteString(fileHandle,json);  
   FileClose(fileHandle); 
}

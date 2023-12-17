//
// Vivado(TM)
// rundef.js: a Vivado-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "D:/vivadoInstalled/Xilinx/Vitis/2023.2/bin;D:/vivadoInstalled/Xilinx/Vivado/2023.2/ids_lite/ISE/bin/nt64;D:/vivadoInstalled/Xilinx/Vivado/2023.2/ids_lite/ISE/lib/nt64;D:/vivadoInstalled/Xilinx/Vivado/2023.2/bin;";
} else {
  PathVal = "D:/vivadoInstalled/Xilinx/Vitis/2023.2/bin;D:/vivadoInstalled/Xilinx/Vivado/2023.2/ids_lite/ISE/bin/nt64;D:/vivadoInstalled/Xilinx/Vivado/2023.2/ids_lite/ISE/lib/nt64;D:/vivadoInstalled/Xilinx/Vivado/2023.2/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "vivado",
         "-log ALU_combi2.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source ALU_combi2.tcl" );



function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}

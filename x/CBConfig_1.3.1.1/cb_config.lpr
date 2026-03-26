program cb_config;

{$mode objfpc}{$H+}

uses
  Interfaces, // this includes the LCL widgetset
  Forms
  { add your units here }, main, Unit_BS;

{$R *.res}

begin
  Application.Title:='Commboard config tool';
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.


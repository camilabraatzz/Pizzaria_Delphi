unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, uDataModule, Vcl.Menus, Vcl.Imaging.jpeg, System.ImageList, Vcl.ImgList,
  Vcl.Imaging.pngimage, uFrmListaDeVendedores, uFrmListaDePedidos, uFrmListaDeSabores;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ImageList1: TImageList;
    btnCliente: TButton;
    Image1: TImage;
    btnVendedores: TButton;
    btnPedido: TButton;
    btnSabores: TButton;
    procedure btnClienteClick(Sender: TObject);
    procedure btnVendedoresClick(Sender: TObject);
    procedure btnPedidoClick(Sender: TObject);
    procedure btnSaboresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uFrmListaDeClientes;

{$R *.dfm}


procedure TForm1.btnClienteClick(Sender: TObject);
begin
  FrmListaClientes.ShowModal;
end;

procedure TForm1.btnPedidoClick(Sender: TObject);
begin
  FrmListaDePedidos.ShowModal;
end;

procedure TForm1.btnSaboresClick(Sender: TObject);
begin
  FrmListaSabores.ShowModal;
end;

procedure TForm1.btnVendedoresClick(Sender: TObject);
begin
  FrmListaDeVendedores.ShowModal;
end;

end.

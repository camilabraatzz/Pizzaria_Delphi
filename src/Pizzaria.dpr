program Pizzaria;

uses
  Vcl.Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {Form1},
  uDataModule in 'view\uDataModule.pas' {DM: TDataModule},
  uFrmClientesInserir in 'view\uFrmClientesInserir.pas' {FrmClientesInserir},
  uCliente in 'classe\uCliente.pas',
  uException in 'exception\uException.pas',
  uFrmListaDeClientes in 'view\uFrmListaDeClientes.pas' {FrmListaClientes},
  uBaseDAO in 'classe\uBaseDAO.pas',
  uClienteDAO in 'classe\uClienteDAO.pas',
  uFrmClienteEditar in 'view\uFrmClienteEditar.pas' {FrmClienteEditar},
  uVendedor in 'classe\uVendedor.pas',
  uVendedorDAO in 'classe\uVendedorDAO.pas',
  Vcl.Themes,
  Vcl.Styles,
  uFrmVendedorInserir in 'view\uFrmVendedorInserir.pas' {FrmVendedorInserir},
  uFrmVendedorEditar in 'view\uFrmVendedorEditar.pas' {FrmVendedorEditar},
  uFrmListaDeVendedores in 'view\uFrmListaDeVendedores.pas' {FrmListaDeVendedores},
  uFrmListaDePedidos in 'view\uFrmListaDePedidos.pas' {FrmListaDePedidos},
  uPedidoDAO in 'classe\uPedidoDAO.pas',
  uPedido in 'classe\uPedido.pas',
  uFrmPedidoEditar in 'view\uFrmPedidoEditar.pas' {FrmPedidoEditar},
  uFrmPedidoInserir in 'view\uFrmPedidoInserir.pas' {FrmPedidoInserir},
  uSabor in 'classe\uSabor.pas',
  uSaborDAO in 'classe\uSaborDAO.pas',
  uFrmListaDeSabores in 'view\uFrmListaDeSabores.pas' {FrmListaSabores},
  uFrmSaborEditar in 'view\uFrmSaborEditar.pas' {FrmSaborEditar},
  uFrmSaborInserir in 'view\uFrmSaborInserir.pas' {FrmSaborInserir},
  uPessoa in 'classe\uPessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Auric');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmClientesInserir, FrmClientesInserir);
  Application.CreateForm(TFrmListaClientes, FrmListaClientes);
  Application.CreateForm(TFrmClienteEditar, FrmClienteEditar);
  Application.CreateForm(TFrmVendedorInserir, FrmVendedorInserir);
  Application.CreateForm(TFrmVendedorEditar, FrmVendedorEditar);
  Application.CreateForm(TFrmListaDeVendedores, FrmListaDeVendedores);
  Application.CreateForm(TFrmListaDePedidos, FrmListaDePedidos);
  Application.CreateForm(TFrmPedidoEditar, FrmPedidoEditar);
  Application.CreateForm(TFrmPedidoInserir, FrmPedidoInserir);
  Application.CreateForm(TFrmListaSabores, FrmListaSabores);
  Application.CreateForm(TFrmSaborEditar, FrmSaborEditar);
  Application.CreateForm(TFrmSaborInserir, FrmSaborInserir);
  Application.Run;
end.

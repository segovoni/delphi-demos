unit ICalc;

interface

type
  /// <summary>
  ///   This interface is implemented by the View. The View can be a VCL form
  ///   or a class that simulates the view in a console application.
  /// </summary>
  /// <remarks>
  ///   <para>
  ///     The view's interface is made up with two "virtual sections"
  ///   </para>
  ///   <list type="bullet">
  ///     <item>
  ///       Input
  ///     </item>
  ///     <item>
  ///       Output
  ///     </item>
  ///   </list>
  ///   <para>
  ///     In the input section you have to specify a function (without
  ///     parameters) for each input the presenter must recover from view. In
  ///     the output section you have to specify a procedure for each output
  ///     the presenter wants to push out to the view. In addition, it is
  ///     possible to implement a function with parameters for each iteration
  ///     the presenter wants to perform with the view.
  ///   </para>
  /// </remarks>
  ICalcView = interface
  ['{92CF2015-60DA-4A11-A00F-2FCBC6115B6F}']
    // input (function)
    function GetValueOne: Integer;
    function GetValueTwo: Integer;
    function GetOperator: string;

    // output (procedure)
    procedure SetResult(AValue: Integer);
    procedure DisplayMessage(AValue: string);

    // input/output
    function AskConfirmation(AValue: string): Boolean;
  end;

implementation

end.

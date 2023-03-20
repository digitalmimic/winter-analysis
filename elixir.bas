Attribute VB_Name = "Module1"
Sub Main()
    Call identifySEC("G2", "L2", "M2", "N2")
    Call identifyEthnicity("I2", "O2", "P2")
End Sub

Sub identifySEC(cell, lowOutput, midOutput, highOutput)
    Range(lowOutput).Value = 0
    Range(midOutput).Value = 0
    Range(highOutput).Value = 0
    Dim row As Integer
    NumRows = Range(cell, Range(cell).End(xlDown)).Rows.Count
    Range(cell).Select
    NSSEC_1_2_LOW = Array("low")
    NSSEC_3_6_MID = Array("mid")
    NSSEC_7_8_HIGH = Array("high")
   
    For row = 1 To NumRows
        If IsNumeric(Application.Match(LCase(ActiveCell.Value), NSSEC_1_2_LOW, 0)) Then
            Range(lowOutput).Value = Range(lowOutput).Value + 1
        ElseIf IsNumeric(Application.Match(LCase(ActiveCell.Value), NSSEC_3_6_MID, 0)) Then
            Range(midOutput).Value = Range(midOutput).Value + 1
        ElseIf IsNumeric(Application.Match(LCase(ActiveCell.Value), NSSEC_7_8_HIGH, 0)) Then
            Range(highOutput).Value = Range(highOutput).Value + 1
        End If
        ActiveCell.Offset(1, 0).Select
   Next
End Sub

Sub identifyEthnicity(cell, wbOutput, emOutput)
    Range(wbOutput).Value = 0
    Range(emOutput).Value = 0
    Dim row As Integer
    NumRows = Range(cell, Range(cell).End(xlDown)).Rows.Count
    Range(cell).Select
   
    For row = 1 To NumRows
        If InStr(1, ActiveCell.Value, "White British") > 0 Then
            Range(wbOutput).Value = Range(wbOutput).Value + 1
        ElseIf InStr(1, ActiveCell.Value, "Not stated") = 0 And InStr(1, ActiveCell.Value, "NULL") = 0 Then
            Range(emOutput).Value = Range(emOutput).Value + 1
        End If
        ActiveCell.Offset(1, 0).Select
    Next
End Sub

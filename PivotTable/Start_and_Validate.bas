Attribute VB_Name = "Start_and_Validate"
Option Explicit

Sub main()
    
    Dim rngData As Range
    Dim PT As PivotTable
    Dim PC As PivotCache
    
    Dim s_sheet As Worksheet
    Dim p_sheet As Worksheet
    
    If Sheet1.Name <> SOURCE_WORKSHEET Then Sheet1.Name = SOURCE_WORKSHEET
    
    If Sheet1.Name <> SOURCE_WORKSHEET Or Worksheets(SOURCE_WORKSHEET).Range("A1") = "" Then
        MsgBox "The Source Data is empty", vbCritical = vbOKOnly, "Error Input data"
        Exit Sub
    End If
    
    Call SheetDelete

    CreateWorksheetIfNotExist (PIVOT_WORKSHEET)
    CreateWorksheetIfNotExist ANALYSE_WORKSHEET, SOURCE_WORKSHEET
    
    Call CreatePivotTable(PT, PC, rngData)
    

    Set PT = Nothing
    Set PC = Nothing
    Set rngData = Nothing
    

End Sub

Sub CreateWorksheetIfNotExist(ByVal sheet As String, Optional beforeSheet As String)

    Dim w_sheet As Worksheet
    
    If DoesWorksheetExist(sheet) = False Then
        If Len(beforeSheet) <> 0 Then
            ActiveWorkbook.Worksheets.Add(After:=Sheets(beforeSheet)).Name = sheet
        Else
            ActiveWorkbook.Worksheets.Add(After:=Sheets(Sheets.Count)).Name = sheet
        End If
    End If

End Sub

Function DoesWorksheetExist(ByVal sheet As String) As Boolean

    Dim w_sheet As Worksheet
    
    For Each w_sheet In Worksheets
        If w_sheet.Name = sheet Then
            DoesWorksheetExist = True
            Exit Function
        End If
    Next w_sheet

    DoesWorksheetExist = False
    
End Function

Sub SheetDelete()

    Dim wsX As Worksheet
    
    Application.DisplayAlerts = False 'not print message to saving data
    
    For Each wsX In Worksheets
        If wsX.Name <> SOURCE_WORKSHEET Then wsX.Delete
    Next wsX

End Sub

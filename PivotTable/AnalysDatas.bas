Attribute VB_Name = "AnalysDatas"
Option Explicit

Sub CreatePivotTable(ByRef PT As PivotTable, ByRef PC As PivotCache, ByRef rngData As Range)
    
    Dim LastRow As Long
    Dim s_sheet As Worksheet
    Dim p_sheet As Worksheet
   
    Application.ScreenUpdating = False
    Set s_sheet = Worksheets(SOURCE_WORKSHEET)
    s_sheet.Activate
    Set rngData = Range("A1").CurrentRegion
    ' LastRow = s_sheet.Cells(s_sheet.Rows.Count, "A").End(xlUp).Row
    ' Set rngData = Range("A1:G" & LastRow)
    
    Set p_sheet = Worksheets(PIVOT_WORKSHEET)
    Set PC = ActiveWorkbook.PivotCaches.Create(SourceType:=xlDatabase, SourceData:=rngData.Address)
    Set PT = PC.CreatePivotTable(TableDestination:=Worksheets(PIVOT_WORKSHEET).[a1], TableName:="Order Table")

    Worksheets(PIVOT_WORKSHEET).Activate
    
    Call EnterDataInPivot(PT)
    
End Sub

Sub EnterDataInPivot(ByRef PT As PivotTable)

    Dim nameOfFruits As String
    Dim month As String
    Dim day As String
    Dim storage As Variant
    Dim sale As Variant
    Dim manager As String
    Dim customer As String
    Dim s_sheet As Worksheet
    
    Set s_sheet = Worksheets(SOURCE_WORKSHEET)
    nameOfFruits = s_sheet.Cells(1, 1)
    month = s_sheet.Cells(1, 2)
    day = s_sheet.Cells(1, 3)
    storage = s_sheet.Cells(1, 4)
    sale = s_sheet.Cells(1, 5)
    manager = s_sheet.Cells(1, 6)
    customer = s_sheet.Cells(1, 7)
    
    With PT
        .ManualUpdate = True
        .AddFields RowFields:=Array(nameOfFruits, storage), ColumnFields:=Array(month, day), _
                    PageFields:=Array(manager, customer)
        .PivotFields(nameOfFruits).ShowDetail = False
        .PivotFields(month).ShowDetail = False
        
        .AddDataField field:=.PivotFields(sale), Caption:="Sale Values", Function:=xlSum
        .PivotFields(sale).NumberFormat = "#,##0"
        
        .AddDataField field:=.PivotFields(sale), Caption:="Count Of Values", Function:=xlCount
        .PivotFields(sale).NumberFormat = "#,##0"
        
        .DataPivotField.Orientation = xlRowField
        .DataPivotField.Position = 1
        
        .DisplayFieldCaptions = False
        
        .TableStyle2 = "pivotstylemedium9"
        .ManualUpdate = False
        
    End With

End Sub

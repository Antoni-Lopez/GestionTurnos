Imports System.Drawing
Imports System.IO
Imports System.Runtime.InteropServices

Public Class Printer
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Archivos css y distintas librerias.
        Dim clsGeneral As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

        Dim Name_turno As Integer, IDCliente As Integer, IDCentro As Integer, Nombre_servicio As String
        IDCliente = Request.QueryString("IDCliente")
        IDCentro = Request.QueryString("IDCentro")
        Name_turno = Request.QueryString("IDServicio")

        Dim ruta_imagen As String = "img/PEINARTE-LOG0(650x300).png"
        Dim ruta_qr As String = "img/20190329171031.jpg"
        Dim ciudad As String = "Alicante"
        Dim direccion As String = "Carlota Pasaron anunciacion, 25 2ºA"
        Dim hora As String = "16:00"
        Dim fecha As String = "29/03/19"

        logo_banner.Text = "<img src=" & ruta_imagen & " id='logo_banner' class='img_logo' />"
        adres.InnerHtml = direccion
        location.InnerText = ciudad


        fecha_hora_ticket.InnerHtml = "" & fecha & " - " & hora
        qr_img.Text = "<img src=" & ruta_qr & " id='qr_img' class='img_qr' />"

        Select Case Name_turno
            Case 1
                Nombre_servicio = "Servicio de peluquería"
                servicio_mostrar.InnerHtml = Nombre_servicio
            Case 2
                Nombre_servicio = "Servicio de masajes"
                servicio_mostrar.InnerHtml = Nombre_servicio
            Case 3
                Nombre_servicio = "Servicio de fisioterapia"
                servicio_mostrar.InnerHtml = Nombre_servicio
            Case 4
                Nombre_servicio = "Servicio de Manícura/Pedícura"
                servicio_mostrar.InnerHtml = Nombre_servicio
        End Select












    End Sub

End Class

Public Class EscPOS

    Private Shared PrintNam As String = "POS"
    Private Shared RawPrinting As Object

    Public Shared Property PrinterName
        Set(value)
            PrintNam = value
        End Set
        Get
            Return PrintNam
        End Get
    End Property

    ' Structure and API declarions:
    <StructLayout(LayoutKind.Sequential, CharSet:=CharSet.Unicode)>
    Structure DOCINFOW
        <MarshalAs(UnmanagedType.LPWStr)> Public pDocName As String
        <MarshalAs(UnmanagedType.LPWStr)> Public pOutputFile As String
        <MarshalAs(UnmanagedType.LPWStr)> Public pDataType As String
    End Structure

    <DllImport("winspool.Drv", EntryPoint:="OpenPrinterW",
       SetLastError:=True, CharSet:=CharSet.Unicode,
       ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)>
    Public Shared Function OpenPrinter(ByVal src As String, ByRef hPrinter As IntPtr, ByVal pd As Long) As Boolean
    End Function
    <DllImport("winspool.Drv", EntryPoint:="ClosePrinter",
       SetLastError:=True, CharSet:=CharSet.Unicode,
       ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)>
    Public Shared Function ClosePrinter(ByVal hPrinter As IntPtr) As Boolean
    End Function
    <DllImport("winspool.Drv", EntryPoint:="StartDocPrinterW",
       SetLastError:=True, CharSet:=CharSet.Unicode,
       ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)>
    Public Shared Function StartDocPrinter(ByVal hPrinter As IntPtr, ByVal level As Int32, ByRef pDI As DOCINFOW) As Boolean
    End Function
    <DllImport("winspool.Drv", EntryPoint:="EndDocPrinter",
       SetLastError:=True, CharSet:=CharSet.Unicode,
       ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)>
    Public Shared Function EndDocPrinter(ByVal hPrinter As IntPtr) As Boolean
    End Function
    <DllImport("winspool.Drv", EntryPoint:="StartPagePrinter",
       SetLastError:=True, CharSet:=CharSet.Unicode,
       ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)>
    Public Shared Function StartPagePrinter(ByVal hPrinter As IntPtr) As Boolean
    End Function
    <DllImport("winspool.Drv", EntryPoint:="EndPagePrinter",
       SetLastError:=True, CharSet:=CharSet.Unicode,
       ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)>
    Public Shared Function EndPagePrinter(ByVal hPrinter As IntPtr) As Boolean
    End Function
    <DllImport("winspool.Drv", EntryPoint:="WritePrinter",
       SetLastError:=True, CharSet:=CharSet.Unicode,
       ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)>
    Public Shared Function WritePrinter(ByVal hPrinter As IntPtr, ByVal pBytes As IntPtr, ByVal dwCount As Int32, ByRef dwWritten As Int32) As Boolean
    End Function

    Public Shared Function PrintImage(BM As Bitmap) As Boolean

        Dim b As Byte() = ConvertImagetoBytes(BM)
        Dim bSuccess As Boolean
        Dim pUnmanagedBytes As IntPtr

        ' Allocate some unmanaged memory for those bytes.
        pUnmanagedBytes = Marshal.AllocCoTaskMem(b.Count)
        ' Copy the managed byte array into the unmanaged array.
        Marshal.Copy(b, 0, pUnmanagedBytes, b.Count)
        ' Send the unmanaged bytes to the printer.
        bSuccess = EscPOS.PrintBytes(b)

        Return bSuccess
    End Function
    Public Shared Function PrintBytes(Document As Byte()) As Boolean
        Dim hPrinter As IntPtr      ' The printer handle.
        Dim dwError As Int32        ' Last error - in case there was trouble.
        Dim di As DOCINFOW       ' Describes your document (name, port, data type).
        Dim dwWritten As Int32      ' The number of bytes written by WritePrinter().
        Dim bSuccess As Boolean     ' Your success code.

        ' Set up the DOCINFO structure.

        di = New DOCINFOW
        di.pDocName = "RAW LOGO"
        di.pDataType = "RAW"

        hPrinter = New IntPtr(0)

        bSuccess = False
        If OpenPrinter(PrinterName.Normalize(), hPrinter, 0) Then
            If StartDocPrinter(hPrinter, 1, di) Then
                Dim managedData As Byte()
                Dim unmanagedData As IntPtr

                managedData = Document
                unmanagedData = Marshal.AllocCoTaskMem(managedData.Length)
                Marshal.Copy(managedData, 0, unmanagedData, managedData.Length)

                If StartPagePrinter(hPrinter) Then
                    bSuccess = WritePrinter(hPrinter, unmanagedData, managedData.Length, dwWritten)
                    EndPagePrinter(hPrinter)
                End If
                Marshal.FreeCoTaskMem(unmanagedData)
                EndDocPrinter(hPrinter)
            End If
            ClosePrinter(hPrinter)
        End If
        If bSuccess = False Then
            dwError = Marshal.GetLastWin32Error()
        End If
        Return bSuccess
    End Function
    Public Shared Function ConvertImagetoBytes(BM As Bitmap) As Byte()
        Dim Data As BitMapData = GetBitmapData(BM)
        Dim Op As New IO.MemoryStream
        Dim bw As New BinaryWriter(Op)

        bw.Write(Chr(System.windows.forms.Keys.Escape))
        bw.Write("@"c)

        ' So we have our bitmap data sitting in a bit array called "dots."
        ' This is one long array of 1s (black) and 0s (white) pixels arranged
        ' as if we had scanned the bitmap from top to bottom, left to right.
        ' The printer wants to see these arranged in bytes stacked three high.
        ' So, essentially, we need to read 24 bits for x = 0, generate those
        ' bytes, and send them to the printer, then keep increasing x. If our
        ' image is more than 24 dots high, we have to send a second bit image
        ' command to draw the next slice of 24 dots in the image.

        ' Set the line spacing to 24 dots, the height of each "stripe" of the
        ' image that we're drawing. If we don't do this, and we need to
        ' draw the bitmap in multiple passes, then we'll end up with some
        ' whitespace between slices of the image since the default line
        ' height--how much the printer moves on a newline--is 30 dots.
        bw.Write(Chr(System.Windows.Forms.Keys.Escape))
        bw.Write("3"c)
        ' '3' just means 'change line height command'
        bw.Write(CByte(24))

        ' OK. So, starting from x = 0, read 24 bits down and send that data
        ' to the printer. The offset variable keeps track of our global 'y'
        ' position in the image. For example, if we were drawing a bitmap
        ' that is 48 pixels high, then this while loop will execute twice,
        ' once for each pass of 24 dots. On the first pass, the offset is
        ' 0, and on the second pass, the offset is 24. We keep making
        ' these 24-dot stripes until we've run past the height of the
        ' bitmap.
        Dim offset As Integer = 0
        Dim width As Byte()

        While offset < Data.Height
            ' The third and fourth parameters to the bit image command are
            ' 'nL' and 'nH'. The 'L' and the 'H' refer to 'low' and 'high', respectively.
            ' All 'n' really is is the width of the image that we're about to draw.
            ' Since the width can be greater than 255 dots, the parameter has to
            ' be split across two bytes, which is why the documentation says the
            ' width is 'nL' + ('nH' * 256).
            bw.Write(Chr(System.Windows.Forms.Keys.Escape))
            bw.Write("*"c)
            ' bit-image mode
            bw.Write(CByte(33))
            ' 24-dot double-density
            width = BitConverter.GetBytes(Data.Width)
            bw.Write(width(0))
            ' width low byte
            bw.Write(width(1))
            ' width high byte
            For x As Integer = 0 To Data.Width - 1
                ' Remember, 24 dots = 24 bits = 3 bytes.
                ' The 'k' variable keeps track of which of those
                ' three bytes that we're currently scribbling into.
                For k As Integer = 0 To 2
                    Dim slice As Byte = 0
                    ' A byte is 8 bits. The 'b' variable keeps track
                    ' of which bit in the byte we're recording.
                    For b As Integer = 0 To 7
                        ' Calculate the y position that we're currently
                        ' trying to draw. We take our offset, divide it
                        ' by 8 so we're talking about the y offset in
                        ' terms of bytes, add our current 'k' byte
                        ' offset to that, multiple by 8 to get it in terms
                        ' of bits again, and add our bit offset to it.
                        Dim y As Integer = (((offset \ 8) + k) * 8) + b
                        ' Calculate the location of the pixel we want in the bit array.
                        ' It'll be at (y * width) + x.
                        Dim i As Integer = (y * Data.Width) + x
                        ' If the image (or this stripe of the image)
                        ' is shorter than 24 dots, pad with zero.
                        Dim v As Boolean = False
                        If i < Data.Dots.Length Then
                            v = Data.Dots(i)
                        End If
                        ' Finally, store our bit in the byte that we're currently
                        ' scribbling to. Our current 'b' is actually the exact
                        ' opposite of where we want it to be in the byte, so
                        ' subtract it from 7, shift our bit into place in a temp
                        ' byte, and OR it with the target byte to get it into there.
                        slice = slice Or CByte((If(v, 1, 0)) << (7 - b))
                    Next
                    ' Phew! Write the damn byte to the buffer
                    bw.Write(slice)
                Next
            Next
            ' We're done with this 24-dot high pass. Render a newline
            ' to bump the print head down to the next line
            ' and keep on trucking.
            offset = offset + 24
            bw.Write(vbCrLf.ToCharArray)
        End While

        ' Restore the line spacing to the default of 30 dots.
        bw.Write(Chr(System.Windows.Forms.Keys.Escape))
        bw.Write("3"c)
        bw.Write(CByte(30))

        bw.Flush()

        Return Op.ToArray
    End Function
    Private Shared Function GetBitmapData(BM As Bitmap) As BitMapData
        Dim threshold = 127
        Dim index As Integer = 0
        Dim dimensions As Integer = BM.Width * BM.Height
        Dim dots As BitArray = New BitArray(dimensions)
        Dim res As New BitMapData
        Dim a As Integer

        For y = 0 To BM.Height - 1
            For x = 0 To BM.Width - 1
                Dim col As Color = BM.GetPixel(x, y)
                Dim luminance = CInt(col.R * 0.3 + col.G * 0.59 + col.B * 0.11)
                If (luminance < threshold) = True Then
                    a = 1
                End If
                dots(index) = (luminance < threshold)
                index = index + 1
            Next
        Next
        res.Dots = dots : res.Height = BM.Height : res.Width = BM.Width
        Return res
    End Function
    Private Class BitMapData
        Public Dots As BitArray
        Public Height As Int16
        Public Width As Int16
    End Class

    ' When the function is given a printer name and an unmanaged array of  
    ' bytes, the function sends those bytes to the print queue.
    ' Returns True on success or False on failure.
    Private Shared Function PrintEsto(ByVal pBytes As IntPtr, ByVal dwCount As Int32) As Boolean
        Dim hPrinter As IntPtr      ' The printer handle.
        Dim dwError As Int32        ' Last error - in case there was trouble.
        Dim di As DOCINFOW = Nothing         ' Describes your document (name, port, data type).
        Dim dwWritten As Int32      ' The number of bytes written by WritePrinter().
        Dim bSuccess As Boolean     ' Your success code.

        ' Set up the DOCINFO structure.
        With di
            .pDocName = "RAW Document"
            .pDataType = "RAW"
        End With
        ' Assume failure unless you specifically succeed.
        bSuccess = False
        If OpenPrinter(PrinterName, hPrinter, 0) Then
            If StartDocPrinter(hPrinter, 1, di) Then
                If StartPagePrinter(hPrinter) Then
                    ' Write your printer-specific bytes to the printer.
                    bSuccess = WritePrinter(hPrinter, pBytes, dwCount, dwWritten)
                    EndPagePrinter(hPrinter)
                End If
                EndDocPrinter(hPrinter)
            End If
            ClosePrinter(hPrinter)
        End If
        ' If you did not succeed, GetLastError may give more information
        ' about why not.
        If bSuccess = False Then
            dwError = Marshal.GetLastWin32Error()
        End If
        Return bSuccess
    End Function

    ' SendFileToPrinter()
    ' When the function is given a file name and a printer name, 
    ' the function reads the contents of the file and sends the
    ' contents to the printer.
    ' Presumes that the file contains printer-ready data.
    ' Shows how to use the SendBytesToPrinter function.
    ' Returns True on success or False on failure.
    Public Shared Function PrintFile(ByVal szFileName As String) As Boolean
        ' Open the file.
        Try
            Dim fs As New FileStream(szFileName, FileMode.Open)
            ' Create a BinaryReader on the file.
            Dim br As New BinaryReader(fs)
            ' Dim an array of bytes large enough to hold the file's contents.
            Dim bytes(fs.Length) As Byte
            Dim bSuccess As Boolean
            ' Your unmanaged pointer.
            Dim pUnmanagedBytes As IntPtr

            ' Read the contents of the file into the array.
            bytes = br.ReadBytes(fs.Length)
            ' Allocate some unmanaged memory for those bytes.
            pUnmanagedBytes = Marshal.AllocCoTaskMem(fs.Length)
            ' Copy the managed byte array into the unmanaged array.
            Marshal.Copy(bytes, 0, pUnmanagedBytes, fs.Length)
            ' Send the unmanaged bytes to the printer.
            bSuccess = PrintEsto(pUnmanagedBytes, fs.Length)
            ' Free the unmanaged memory that you allocated earlier.
            Marshal.FreeCoTaskMem(pUnmanagedBytes)
            fs.Close()
            Return bSuccess
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        End Try
    End Function

    ' When the function is given a string and a printer name,
    ' the function sends the string to the printer as raw bytes.
    Public Shared Function PrintString(ByVal szString As String)
        Dim pBytes As IntPtr
        Dim dwCount As Int32
        Dim Res As Boolean
        ' How many characters are in the string?
        dwCount = szString.Length()
        ' Assume that the printer is expecting ANSI text, and then convert
        ' the string to ANSI text.
        pBytes = Marshal.StringToCoTaskMemAnsi(szString)
        ' Send the converted ANSI string to the printer.
        Res = PrintEsto(pBytes, dwCount)
        Marshal.FreeCoTaskMem(pBytes)

        Return Res
    End Function


End Class
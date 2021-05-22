//---------------------------------------------------------------//
//---------------------------------------------------------------//
//-------------------------- TU Berlin --------------------------//
//--------- Fakultaet IV: Elektrotechnik und Informatik ---------//
//---------------------------------------------------------------//
//--------- Fachgebiet fuer Energieversorgungsnetze und ---------//
//---------- Integration erneuerbarer Energien (SENSE) ----------//
//---------------------------------------------------------------//
//-------------------- Elektrische Netzwerke --------------------//
//-------------------------- Praktikum --------------------------//
//---------------------------------------------------------------//
//---------------------------------------------------------------//
//----- Einlese-Funktion fuer aus LTspice exportierte Daten -----//
//---------------------------------------------------------------//
//-------- Autor: Martin Otto           -------------------------//
//-------- Version: 1.2.0               -------------------------//
//-------- Stand: 03.05.2018,  8.55 Uhr -------------------------//
//---------------------------------------------------------------//
//---------------------------------------------------------------//
function [M]=readLTspice(fileName, selector, nTraces)
    //Format: Zeitbereich
    if selector=="Time" | selector=="time" then
        tempFileName = part(fileName, 1:$-4) + "_Temp.txt";
        textOriginal = mgetl(fileName);
        [nRows,nColumns] = size(textOriginal);
        textKorrigiert = strsubst(textOriginal(2:nRows), ascii(9), ",");
        mputl(textKorrigiert, tempFileName);
        M = read(tempFileName, -1, 1+nTraces);
        deletefile(tempFileName);
    //Format: Polarform (dB,deg)
    elseif selector=="Bode" | selector=="bode" then
        tempFileName = part(fileName, 1:$-4) + "_Temp.txt";
        textOriginal = mgetl(fileName);
        [nRows,nColumns] = size(textOriginal);
        textKorrigiert = strsubst(textOriginal(2:nRows), "°", "");
        textKorrigiert = strsubst(textKorrigiert, "dB", "");
        textKorrigiert = strsubst(textKorrigiert, "(", "");
        textKorrigiert = strsubst(textKorrigiert, ")", "");
        textKorrigiert = strsubst(textKorrigiert, ascii(9), ",");
        mputl(textKorrigiert, tempFileName);
        M = read(tempFileName, -1, 1+2*nTraces);
        deletefile(tempFileName);
    //Format: kartesische Form (Re,Im)
    elseif selector=="Nyquist" | selector=="nyquist" then
        tempFileName = part(fileName, 1:$-4) + "_Temp.txt";
        textOriginal = mgetl(fileName);
        [nRows,nColumns] = size(textOriginal);
        textKorrigiert = strsubst(textOriginal(2:nRows), ascii(9), ",");
        mputl(textKorrigiert, tempFileName);
        M = read(tempFileName, -1, 1+2*nTraces);
        deletefile(tempFileName);
    //falsche Eingabe
    else
        error("Argument für Format der exportierten Daten unzulässig!" + ascii(10) + "Bitte überprüfe, wie du die Daten aus LTspice exportiert hast" + ascii(10) + "und nutze dann eines der folgenden Argumente: [Time], [Bode], [Nyquist]." + ascii(10) + ascii(10) + "Der LTspice-Leitfaden im ISIS-Kurs gibt genauere Hinweise zur Verwendung von [readLTspice]." + ascii(10), 100000);
    end
endfunction

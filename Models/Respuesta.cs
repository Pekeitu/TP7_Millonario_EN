namespace TP7.Models;

public class Respuesta{
    public int idRespuesta{get; set;}
    public int idPregunta{get; set;}
    public char opcionRespuesta{get;set;}
    public string txtRespuesta{get;set;}
    public bool correcta{get;set;}
    public string idioma{get;set;}
    
    public Respuesta(){
        idRespuesta=-1;
        idPregunta=-1;
        opcionRespuesta=' ';
        txtRespuesta="";
        correcta=false;
        idioma="ES";
    }
    public Respuesta(int idR, int idP, char opResp, string txtResp, bool cor, string idiom){
        idRespuesta=idR;
        idPregunta=idP;
        opcionRespuesta = opResp;
        txtRespuesta = txtResp;
        correcta = cor;
        idioma = idiom;
    }
}
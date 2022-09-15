namespace TP7.Models;

public class Pregunta{
    /*private int _idPregunta;
    private string _txtPregunta;
    private int _nivelDificultad;

    public int idPregunta{
        get{return _idPregunta;}
        set{_idPregunta= value;}
    }
    public string txtPregunta{
        get{return _idPregunta;}
    }*/

    public int IdPregunta {get; set;}
    public string txtPregunta {get;}
    public int nivelDificultad{get;}
    public string idioma{get;set;}

    public Pregunta(){
        IdPregunta=-1;
        txtPregunta= "";
        nivelDificultad=-1;
        idioma="EN";
    }

    public Pregunta(int id, string txtPreg, int nDif, string idom){
        IdPregunta=id;
        txtPregunta = txtPreg;
        nivelDificultad=nDif;
        idioma= idom;
    }

}
%{
    #include <fstream>
    #include <iostream>
    #include <vector>
    #include <FlexLexer.h>
    #include <utility>
    using namespace std;
    ifstream fichero;
    ofstream Esc;
    vector<pair<const char*,string> > veclientes;
    const char* first;
    string second;
    pair<string,string> cli;
    void aniadir(vector<pair<const char*,string> > vec);

%}
%option c++
numero  (6[0-9]{8})|(9[0-9]{8})
correo  (.)*(@gmail.com|@hotmail.es|@hotmail.com|@correo.ugr.es)
numcorreo   ({numero}"-"{correo})|({correo}"-"{numero})
%%
{numcorreo} { return 1; }
{numero} { return 2; }
{correo} { return 3; }
%%
void aniadir(vector<pair<const char*,string> > vec){

    for(int i = 0;i < vec.size(); i++){
        Esc << "Cliente "<< i << ": " << vec[i].first << " " << vec[i].second << endl ;
    }

}
int main(int argc,char *argv[]){

    if (argc == 2){
        fichero.open(argv[1]);
        if(!fichero){
            cout << "error de lectura" << endl;
            exit (1);
        }
    }else exit(1);

    yyFlexLexer flujo(&fichero,0);
    cliente = flujo.yylex();
    while(cliente){
        
        switch(cliente)
        {
            case 1:
                first = yytext;
                second = " ";
                cli.first = first;
                cli.second = second;
                veclientes.push_back(cli);
            break;
            case 2:
                first = yytext;
                second = "No tiene correo";
                cli.first = first;
                cli.second = second;
                veclientes.push_back(cli);
            break;
            case 3:
                first = yytext;
                second = "No tiene numero";
                cli.first = first;
                cli.second = second;
                veclientes.push_back(cli);
            break;
            default:
            break;
        }
        cliente = flujo.yylex();
    }
    fichero.close();

    Esc.open("Resultadofinal.txt");
    if(!Esc){
        cout << "Error al crear el archivo resultante" << endl; ;
        exit(1);
    }
    yyFlexLexer flujo2(&Esc,&Esc);
    aniadir(veclientes);
    Esc.close();

    return 0;
}
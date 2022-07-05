package com.MagicB.www.Command;
//√¸¡Ó—°‘Ò¿‡
public class CommandChoice {
    public static BaseCommand commandChoice(String choice){
        BaseCommand command=null;
        switch (choice){
            case "user":{
                command=new userCommand();
                break;
            }
            case "pass":{
                command=new passCommand();
                break;
            }
            case "dir":{
                command=new dirCommand();
                break;
            }
            case "get":{
                command=new getCommand();
                break;
            }
            case "upload":{
                command=new uploadCommand();
                break;
            }
        }
        return command;
    }
}

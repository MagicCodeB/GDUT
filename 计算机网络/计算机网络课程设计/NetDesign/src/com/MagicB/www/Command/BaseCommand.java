package com.MagicB.www.Command;

import com.MagicB.www.User.UserInfo;

import java.io.BufferedWriter;
//基础指令接口
public interface BaseCommand {
    public void Command(String data, BufferedWriter writer, UserInfo userInfo);
}

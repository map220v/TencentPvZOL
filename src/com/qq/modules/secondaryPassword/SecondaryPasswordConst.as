package com.qq.modules.secondaryPassword
{
   public class SecondaryPasswordConst
   {
      
      public static const GET_PASSWORD_INFO:String = "Secondary_Password_Get_Password_Info";
      
      public static const INPUT_PASSWORD_RIGHT:String = "Secondary_Password_Input_Password_Right";
      
      public static const INPUT_PASSWORD_WRONG:String = "Secondary_Password_input_Password_Wrong";
      
      public static const UPDATE_PASSWORD_OK:String = "Secondary_Password_Update_Password_Ok";
      
      public static const RESET_PASSWORD_OK:String = "Secondary_Password_Reset_Password_Ok";
      
      public static const ERROR_CODE_INPUT_ERROR:String = "Secondary_Password_Error_Code_Input_Error";
      
      public static const ERROR_CODE_OLD_EQUAL_NEW:String = "Secondary_Password_Error_Code_Old_Equal_New";
      
      public static const WINDOW_TYPE_SET:uint = 1;
      
      public static const WINDOW_TYPE_INPUT:uint = 2;
      
      public static const WINDOW_TYPE_UPDATE:uint = 3;
      
      public static const WINDOW_TYPE_RESET:uint = 4;
      
      public static const WINDOW_TYPE_RESET_CANCEL:uint = 5;
      
      public static const WINDOW_TYPE_SECURITY_CONFIG:uint = 6;
      
      public static const WINDOW_TYPE_FROZEN:uint = 7;
      
      public static const PASSWORD_CHAR_NUM_MIN:uint = 6;
      
      public static const PASSWORD_CHAR_NUM_MAX:uint = 15;
      
      public static const ERROR_NOTICE_RULE:String = "*密码必须由6-15个数字及字符组成";
      
      public static const ERROR_NOTICE_UNMATCH:String = "*两次输入密码不一致";
      
      public static const ERROR_PASSWORD:String = "输入密码不正确，今日还可尝试{0}次！";
      
      public static const ERROR_INPUT_ERROR:String = "输入密码不正确！";
      
      public static const ERROR_OLD_EQUAL_NEW:String = "新密码不能与旧密码相同哦！";
      
      public static const ITEM_BOUNDS:uint = 4;
      
      public static const MAX_ERROR_INPUT_TIMES:uint = 5;
       
      
      public function SecondaryPasswordConst()
      {
         super();
      }
   }
}

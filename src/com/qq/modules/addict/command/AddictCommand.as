package com.qq.modules.addict.command
{
   import PVZ.Cmd.E_AasAdultType;
   import asgui.managers.PopUpManager;
   import asgui.managers.SystemManager;
   import com.qq.constant.addict.AddictConstant;
   import com.qq.modules.addict.view.components.AddictUnRegisterTipWindow;
   import com.qq.modules.main.model.AddictInfo;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class AddictCommand extends StrongRobotlegCommand
   {
       
      
      public function AddictCommand()
      {
         super();
      }
      
      public function loginCheckState() : void
      {
         var _loc1_:AddictUnRegisterTipWindow = null;
         var _loc2_:int = 0;
         if(AddictInfo.getInstance().playerType != E_AasAdultType.AasType_Adult)
         {
            _loc1_ = new AddictUnRegisterTipWindow();
            if(AddictInfo.getInstance().playerType == E_AasAdultType.AasType_UnRegister)
            {
               _loc2_ = AddictConstant.UnRegister;
            }
            else
            {
               _loc2_ = AddictConstant.NotAdult;
            }
            _loc1_.reset(_loc2_);
            PopUpManager.AddPopUp(_loc1_,SystemManager.instance.maskLayer,true,false);
         }
      }
      
      public function showAddictInfo(param1:int) : void
      {
         var _loc2_:AddictUnRegisterTipWindow = new AddictUnRegisterTipWindow();
         var _loc3_:int = 0;
         if(param1 >= 3600 && param1 < 3600 * 2)
         {
            _loc3_ = AddictConstant.Addict_1_Hour_Tip;
         }
         else if(param1 >= 3600 * 2 && param1 < 3600 * 3)
         {
            _loc3_ = AddictConstant.Addict_2_Hour_Tip;
         }
         else if(param1 >= 3600 * 3 && param1 < 3600 * 3.5)
         {
            _loc3_ = AddictConstant.Addict_3_Hour_Tip;
         }
         else if(param1 >= 3600 * 3.5 && param1 < 3600 * 5)
         {
            _loc3_ = AddictConstant.Addict_4_Hour_Tip;
         }
         else if(param1 >= 3600 * 5)
         {
            _loc3_ = AddictConstant.Addict_5_Hour_Tip;
         }
         else
         {
            _loc3_ = AddictConstant.LastAddictType;
         }
         if(_loc3_ > 0)
         {
            PopUpManager.AddPopUp(_loc2_,SystemManager.instance.maskLayer,true);
            _loc2_.reset(_loc3_);
         }
      }
   }
}

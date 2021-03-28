package com.qq.modules.td.command.tips
{
   import com.qq.CommandName;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.templates.font.FontFZCY;
   import com.qq.utils.CommandDispatcher;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class ShowTipCommand extends StrongRobotlegCommand
   {
       
      
      public function ShowTipCommand()
      {
         super();
      }
      
      public function showBigWave(param1:int = 0) : void
      {
         CommandDispatcher.send(CommandName.TD_TextTip_Show,{"tipTextName":"TD_BigWaveTipMC"});
         TDSoundCmd.bigWaveCome();
      }
      
      public function showFinalWave(param1:int = 0) : void
      {
         this.showBigWave();
         CommandDispatcher.send(CommandName.TD_EffectDelay,{
            "callFunc":this.$showFinalWave,
            "excuteTime":TDGameInfo.getInstance().getCurGameTime() + 4000
         });
      }
      
      public function showPlantSetError(param1:int) : void
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case 300:
               _loc2_ = FontFZCY.TIP_PLANT_SET_ERORR_300;
               break;
            case 1100:
               _loc2_ = FontFZCY.TIP_PLANT_SET_ERORR_1100;
               break;
            case 2100:
               _loc2_ = FontFZCY.TIP_PLANT_SET_ERORR_2100;
         }
         if(_loc2_)
         {
            CommandDispatcher.send(CommandName.TD_TextTip_Show,{
               "tipTextName":"TD_GUIDE_TIP",
               "txt":_loc2_
            });
         }
      }
      
      public function showPlantWaveTip(param1:*) : void
      {
         var _loc2_:String = null;
         if(param1 is int)
         {
            switch(param1)
            {
               case 1000:
                  _loc2_ = FontFZCY.TIP_1;
                  break;
               case 1100:
                  _loc2_ = FontFZCY.TIP_2;
                  break;
               case 300:
                  _loc2_ = FontFZCY.TIP_3;
                  break;
               case 900:
                  _loc2_ = FontFZCY.TIP_4;
                  break;
               case 400:
                  _loc2_ = FontFZCY.TIP_5;
            }
         }
         else
         {
            _loc2_ = param1;
         }
         if(_loc2_)
         {
            CommandDispatcher.send(CommandName.TD_TextTip_Show,{
               "tipTextName":"TD_GUIDE_TIP",
               "txt":_loc2_
            });
         }
      }
      
      private function $showFinalWave() : void
      {
         CommandDispatcher.send(CommandName.TD_TextTip_Show,{"tipTextName":"TD_LastWaveTipMC"});
         TDSoundCmd.finalWave();
      }
      
      public function showCountDown(param1:int) : void
      {
         CommandDispatcher.send(CommandName.TD_TextTip_Show,{
            "tipTextName":"countDown",
            "time":param1
         });
      }
   }
}

package com.qq.modules.mapinfo.command
{
   import PVZ.Cmd.Cmd_City_ChangeArea_CS;
   import PVZ.Cmd.Cmd_City_FixedMove_CS;
   import PVZ.Cmd.Cmd_City_Init_CS;
   import PVZ.Cmd.Cmd_City_SetNullShow_CS;
   import PVZ.Cmd.Cmd_Mine_RecallTeam_CS;
   import PVZ.Cmd.Cmd_Outpost_GetAllyTeam_CS;
   import PVZ.Cmd.Cmd_Outpost_ReturnAllyTeam_CS;
   import PVZ.Cmd.Cmd_War_DeclareWar_CS;
   import PVZ.Cmd.Cmd_War_GetDeclareWarStat_CS;
   import PVZ.Cmd.Cmd_War_GetHistory_CS;
   import PVZ.Cmd.Cmd_War_GetSimpleHistory_CS;
   import PVZ.Cmd.Cmd_War_RecallTeam_CS;
   import PVZ.Cmd.Cmd_War_SpeedUpTeam_CS;
   import PVZ.Cmd.Cmd_WorldMap_GetCellInfo_CS;
   import PVZ.Cmd.Cmd_WorldMap_GetCityInfo_CS;
   import PVZ.Cmd.Dto_War_History;
   import PVZ.Cmd.Dto_WorldMap_Pos;
   import PVZ.Cmd.E_BuffType;
   import asgui.controls.Alert;
   import asgui.events.CloseEvent;
   import asgui.utils.StringUtil;
   import com.qq.constant.ItemID;
   import com.qq.display.QAlert;
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.main.command.CmdStoreProxyCmd;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.model.vo.BuffVO;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.main.service.BuffProxy;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import com.qq.templates.font.FontHKHB;
   import com.tencent.protobuf.Int64;
   import flash.geom.Point;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class MapInfoProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      [Inject]
      public var actor:ActorModel;
      
      [Inject]
      public var proxy:MapInfoProxy;
      
      [Inject]
      public var buffProxy:BuffProxy;
      
      [Inject]
      public var bagProxy:BagProxy;
      
      public function MapInfoProxyCommand()
      {
         super();
      }
      
      public function getInitInfo() : void
      {
         var _loc1_:Cmd_City_Init_CS = new Cmd_City_Init_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function getDetailArmyHistory(param1:int) : void
      {
         var _loc2_:Cmd_War_GetHistory_CS = new Cmd_War_GetHistory_CS();
         _loc2_.type = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function relocateToArea(param1:int) : void
      {
         var _loc2_:Cmd_City_ChangeArea_CS = new Cmd_City_ChangeArea_CS();
         _loc2_.newArea = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function getSimplelArmyHistory() : void
      {
         var _loc1_:Cmd_War_GetSimpleHistory_CS = new Cmd_War_GetSimpleHistory_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function doMineRecallTeam(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_Mine_RecallTeam_CS = new Cmd_Mine_RecallTeam_CS();
         _loc3_.targetPos = new Dto_WorldMap_Pos();
         _loc3_.targetPos.posX = param1;
         _loc3_.targetPos.posY = param2;
         this.server.sendMessage(_loc3_);
      }
      
      private function createDto_War_History() : Dto_War_History
      {
         var _loc1_:Dto_War_History = new Dto_War_History();
         _loc1_.reportId = new Int64(Math.random() * 50000);
         return _loc1_;
      }
      
      public function changeShowNullCity(param1:Boolean) : void
      {
         var _loc2_:Cmd_City_SetNullShow_CS = new Cmd_City_SetNullShow_CS();
         _loc2_.isShow = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function declareWar(param1:Int64) : void
      {
         var roleId:Int64 = param1;
         var vo:BuffVO = this.buffProxy.getBuffByType(E_BuffType.E_BuffType_WarFree);
         if(vo)
         {
            QAlert.Show("宣战会去取消当前的免战状态，是否宣战？","",Alert.YES | Alert.NO,null,function(param1:CloseEvent):void
            {
               if(param1.detail == Alert.YES)
               {
                  doDeclareWar(roleId);
               }
            });
         }
         else
         {
            this.doDeclareWar(roleId);
         }
      }
      
      public function queryDeclareInfo() : void
      {
         var _loc1_:Cmd_War_GetDeclareWarStat_CS = new Cmd_War_GetDeclareWarStat_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function doDeclareWar(param1:Int64) : void
      {
         var roleId:Int64 = param1;
         if(this.proxy.leftDeclareCount <= 0)
         {
            QAlert.Show(FontHKHB.EXPED_DELCARE_ERROR);
         }
         else
         {
            var onClose:Function = function(param1:CloseEvent):void
            {
               var _loc2_:Cmd_War_DeclareWar_CS = null;
               if(param1.detail == Alert.YES)
               {
                  _loc2_ = new Cmd_War_DeclareWar_CS();
                  _loc2_.roleId = roleId;
                  server.sendMessage(_loc2_);
               }
            };
            QAlert.Show(StringUtil.substitute(FontHKHB.EXPED_DECLARE_TIP,this.proxy.totalDeclareCount,this.proxy.leftDeclareCount),"",Alert.YES | Alert.NO,null,onClose);
         }
      }
      
      public function recallTeam(param1:int, param2:int = 1) : void
      {
         var _loc3_:Cmd_War_RecallTeam_CS = new Cmd_War_RecallTeam_CS();
         _loc3_.teamId = param1;
         _loc3_.recalltype = param2;
         this.server.sendMessage(_loc3_);
      }
      
      public function returnAllyTeam(param1:Int64, param2:int) : void
      {
         var _loc3_:Cmd_Outpost_ReturnAllyTeam_CS = new Cmd_Outpost_ReturnAllyTeam_CS();
         _loc3_.allyId = param1;
         _loc3_.teamId = param2;
         this.server.sendMessage(_loc3_);
      }
      
      public function getMapCityCellDTO(param1:Int64) : void
      {
         var _loc2_:Cmd_WorldMap_GetCellInfo_CS = new Cmd_WorldMap_GetCellInfo_CS();
         _loc2_.roleId = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function getMapCityInfo(param1:Int64) : void
      {
         var _loc2_:Cmd_WorldMap_GetCityInfo_CS = new Cmd_WorldMap_GetCityInfo_CS();
         _loc2_.roleId = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function moveCityRandom() : void
      {
         QAlert.Show("确定进行随机迁城？","",Alert.YES | Alert.NO,null,function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.YES)
            {
               doMoveCityRandom();
            }
         });
      }
      
      public function doMoveCityRandom() : void
      {
      }
      
      public function moveCityFix(param1:int, param2:Point) : void
      {
         var _loc3_:Cmd_City_FixedMove_CS = new Cmd_City_FixedMove_CS();
         _loc3_.area = param1;
         _loc3_.newPos = new Dto_WorldMap_Pos();
         _loc3_.newPos.posX = param2.x;
         _loc3_.newPos.posY = param2.y;
         this.server.sendMessage(_loc3_);
      }
      
      public function getAllyTeamAtHome() : void
      {
         var _loc1_:Cmd_Outpost_GetAllyTeam_CS = new Cmd_Outpost_GetAllyTeam_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function returnAllyTeamAtHome(param1:Int64, param2:uint) : void
      {
         var _loc3_:Cmd_Outpost_ReturnAllyTeam_CS = new Cmd_Outpost_ReturnAllyTeam_CS();
         _loc3_.allyId = param1;
         _loc3_.teamId = param2;
         this.server.sendMessage(_loc3_);
      }
      
      public function speedTeam(param1:int) : void
      {
         if(this.bagProxy.getItemNumByItemID(ItemID.TEAM_SPEED) > 0)
         {
            this.doSpeed(param1);
         }
         else
         {
            CmdStoreProxyCmd.buyByItemID(ItemID.TEAM_SPEED,1,"",0,this.doSpeed,[param1],22);
         }
      }
      
      private function doSpeed(param1:int) : void
      {
         var _loc2_:Cmd_War_SpeedUpTeam_CS = new Cmd_War_SpeedUpTeam_CS();
         _loc2_.teamId = param1;
         _loc2_.itemId = ItemID.TEAM_SPEED;
         this.server.sendMessage(_loc2_);
      }
   }
}

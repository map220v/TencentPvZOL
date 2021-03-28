package com.qq.modules.main.command
{
   import PVZ.Cmd.ChannelType;
   import PVZ.Cmd.ObjInfoType;
   import PVZ.Cmd.SpecialReportType;
   import com.qq.display.QAlert;
   import com.qq.modules.chat.command.ChatProxyCmd;
   import com.qq.modules.map.command.MapViewCmd;
   import com.qq.modules.mapinfo.command.MapInfoViewCmd;
   import com.qq.modules.topKing.command.TopKingCmd;
   import com.qq.modules.union.command.UnionCmd;
   import com.tencent.protobuf.Int64;
   import flash.geom.Point;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TextLinkTriglerCommand extends StrongRobotlegCommand
   {
       
      
      public function TextLinkTriglerCommand()
      {
         super();
      }
      
      public function textLinkTrigler(param1:String) : void
      {
         var _loc4_:Array = null;
         var _loc5_:Int64 = null;
         var _loc2_:Array = param1.split("#");
         var _loc3_:String = _loc2_[0];
         if(_loc2_.length > 1)
         {
            _loc4_ = (_loc2_[1] as String).split(",");
         }
         switch(_loc3_)
         {
            case "position":
               MapViewCmd.cameraToCell(new Point(_loc4_[1],_loc4_[2]),int(_loc4_[0]));
               break;
            case "addToChat":
               ChatProxyCmd.sendMsg(ChannelType.ChannelType_World,",大家都来点点看吧！",null,ObjInfoType.E_ObjInfoType_BattleRecorder,Int64.parseInt64(_loc4_[0]));
               break;
            case "battleId":
               if(_loc4_[0] == null)
               {
                  return;
               }
               if(Number(_loc4_[0]) == 0)
               {
                  return;
               }
               _loc5_ = Int64.parseInt64(String(_loc4_[0]));
               GameFlowCmd.queryReport(_loc5_);
               break;
            case "topKingBattleId":
               GameFlowCmd.querySpecialReport(_loc4_[0],SpecialReportType.SpecialReportType_TopFight);
               break;
            case "uin":
               MapInfoViewCmd.showMapRoleWndByRoleId(Int64.parseInt64(String(_loc4_[0])));
               break;
            case "guild_id":
               UnionCmd.showOtherUnionDetailInfo(Int64.parseInt64(String(_loc4_[0])));
               break;
            case "gotoTopKing":
               TopKingCmd.openWindow();
               break;
            case "gotoRankArena":
               GameFlowCmd.gotoRankArena();
               break;
            default:
               QAlert.Show("textLink无法解析");
         }
      }
   }
}

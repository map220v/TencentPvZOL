package com.qq.modules.mapinfo.model.vo
{
   import PVZ.Cmd.Dto_War_History;
   import PVZ.Cmd.E_TeamState;
   import PVZ.Cmd.E_WarResult;
   import PVZ.Cmd.E_WarType;
   import com.qq.utils.DateUtils;
   import com.tencent.protobuf.Int64;
   import flash.geom.Point;
   import org.allencuilib.util.TimeUtils;
   import org.as3commons.logging.api.getLogger;
   
   public class MapInfoWarHistoryVO
   {
       
      
      private var dto:Dto_War_History;
      
      private var lastTotalTime:int;
      
      private var _roleInfo:MapInfoRoleVO;
      
      private var _targetInfo:MapInfoRoleVO;
      
      public function MapInfoWarHistoryVO(param1:Int64, param2:Dto_War_History = null)
      {
         super();
         if(param2)
         {
            this.loadDto(param1,param2);
         }
      }
      
      public function get tabType() : int
      {
         return this.dto.warHistoryType;
      }
      
      public function loadDto(param1:Int64, param2:Dto_War_History) : void
      {
         this.dto = param2;
         if(param2.activeInfo)
         {
            this._roleInfo = new MapInfoRoleVO(param1,param2.activeInfo);
         }
         if(param2.targetInfo)
         {
            this._targetInfo = new MapInfoRoleVO(param1,param2.targetInfo);
         }
      }
      
      public function get roleInfo() : MapInfoRoleVO
      {
         return this._roleInfo;
      }
      
      public function get roleInfoName() : String
      {
         return this.roleInfo.roleName;
      }
      
      public function get allianceName() : String
      {
         return this.roleInfo.allianceName;
      }
      
      public function get targetInfo() : MapInfoRoleVO
      {
         return this._targetInfo;
      }
      
      public function get targetFullName() : String
      {
         return this.targetInfo.getTargetFullName(true);
      }
      
      public function get teamId() : int
      {
         return this.dto.teamId;
      }
      
      public function get reportId() : Int64
      {
         return this.dto.reportId;
      }
      
      public function get hasReport() : Boolean
      {
         return this.reportId != null && !this.reportId.isZero();
      }
      
      public function get warResult() : int
      {
         return this.dto.warResult;
      }
      
      public function toString() : String
      {
         return this.label;
      }
      
      public function get label() : String
      {
         var _loc1_:* = "[" + this.typeLabel + "]";
         if(this.roleInfo)
         {
            _loc1_ += this.roleInfo.roleName + "->";
            if(this.dto.hasTargetInfo)
            {
               _loc1_ += this.targetInfo.roleName;
            }
         }
         if(this.leftTime > 0)
         {
            _loc1_ += ":" + this.leftTime;
         }
         else
         {
            _loc1_ == ":已结束";
         }
         return _loc1_;
      }
      
      public function get areaId() : int
      {
         return this.dto.areaId;
      }
      
      public function getContent(param1:Boolean = true) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = 5;
         switch(this.teamState)
         {
            case E_TeamState.E_TeamState_Marching:
               _loc2_ += this.getNameHtml(this.roleInfo.roleFullName,param1,_loc3_);
               _loc2_ += "正在" + this.typeLabel;
               _loc2_ += this.getNameHtml(this.targetInfo.roleFullName,param1,_loc3_);
               _loc2_ += "的" + this.getNameHtml(this.targetInfo.getTargetFullName(),param1);
               break;
            case E_TeamState.E_TeamState_ReCalling:
            case E_TeamState.E_TeamState_Home:
               _loc2_ += this.getNameHtml(this.roleInfo.roleFullName,param1,_loc3_);
               _loc2_ += this.typeLabel + "的部队";
               _loc2_ += "正在" + this.teamStateLabel;
               break;
            case E_TeamState.E_TeamState_Guarding:
               _loc2_ += this.getNameHtml(this.roleInfo.roleFullName,param1,_loc3_);
               _loc2_ += "正在驻守" + this.getNameHtml(this.targetInfo.getTargetFullName(param1),param1) + "";
               break;
            case E_TeamState.E_TeamState_Returning:
            default:
               _loc2_ += this.getNameHtml(this.roleInfo.roleFullName,param1,_loc3_);
               _loc2_ += "正在" + this.teamStateLabel;
         }
         return _loc2_;
      }
      
      public function get isAttackerWin() : Boolean
      {
         return this.warResult == E_WarResult.E_WarResult_Win && this.roleInfo.isMe || this.warResult == E_WarResult.E_WarResult_Fail && this.targetInfo.isMe;
      }
      
      private function getNameHtml(param1:String, param2:Boolean = false, param3:int = 999) : String
      {
         if(param1.length > param3)
         {
            param1 = param1.substr(0,param3) + "..";
         }
         var _loc4_:* = "";
         if(param2)
         {
            _loc4_ += "<font color=\'#ffff00\'>";
         }
         _loc4_ += param1;
         if(param2)
         {
            _loc4_ += "</font>";
         }
         return _loc4_;
      }
      
      public function get leftTime() : Number
      {
         return this.dto.endTime - DateUtils.getInstance().getServerTime();
      }
      
      public function get leftTimeString() : String
      {
         if(this.leftTime > 0)
         {
            return TimeUtils.GetDigitalTimeString(this.leftTime,true);
         }
         return "";
      }
      
      public function get leftTimeFullString() : String
      {
         var _loc1_:* = null;
         if(this.leftTime > 0)
         {
            _loc1_ = TimeUtils.GetDigitalTimeString(this.leftTime,true);
            if(this.teamState == E_TeamState.E_TeamState_ReCalling)
            {
               _loc1_ += "后到家";
            }
            else if(this.teamState == E_TeamState.E_TeamState_Guarding)
            {
               _loc1_ += "后返回";
            }
            else
            {
               _loc1_ += "后到达";
            }
            return _loc1_;
         }
         return "已到达";
      }
      
      public function get totalTime() : Number
      {
         if(this.dto.taskTime > 0)
         {
            return this.dto.taskTime;
         }
         return this.dto.endTime - this.dto.beginTime;
      }
      
      public function get type() : int
      {
         return this.dto.type;
      }
      
      public function get hasExpired() : Boolean
      {
         getLogger("check time").debug(this.teamState + " " + this.leftTime);
         return this.teamState == E_TeamState.E_TeamState_Home || this.leftTime <= 1;
      }
      
      public function get typeLabel() : String
      {
         switch(this.type)
         {
            case E_WarType.E_WarType_Attack:
               if(this.targetInfo.isMe && !this.roleInfo.isMe)
               {
                  return "入侵";
               }
               return "出征";
               break;
            case E_WarType.E_WarType_BeAttack:
               return "入侵";
            case E_WarType.E_WarType_Reinforce:
            case E_WarType.E_WarType_BeReinforce:
               return "增援";
            default:
               return null;
         }
      }
      
      public function get teamState() : int
      {
         return this.dto.teamState;
      }
      
      public function get teamStateLabel() : String
      {
         switch(this.teamState)
         {
            case E_TeamState.E_TeamState_Guarding:
               return "驻守";
            case E_TeamState.E_TeamState_Marching:
               return this.typeLabel;
            case E_TeamState.E_TeamState_ReCalling:
               return "返回";
            case E_TeamState.E_TeamState_Returning:
               return "撤回";
            case E_TeamState.E_TeamState_Home:
               return "撤回";
            default:
               return null;
         }
      }
      
      public function get teamStateColor() : String
      {
         switch(this.teamState)
         {
            case E_TeamState.E_TeamState_Guarding:
               return "#6666ff";
            case E_TeamState.E_TeamState_Marching:
               switch(this.type)
               {
                  case E_WarType.E_WarType_Attack:
                     if(this.targetInfo.isMe)
                     {
                        return "#ff0000";
                     }
                     return "#ffff00";
                     break;
                  case E_WarType.E_WarType_BeAttack:
                     return "#ff0000";
                  case E_WarType.E_WarType_Reinforce:
                  case E_WarType.E_WarType_BeReinforce:
                     return "#009900";
               }
            case E_TeamState.E_TeamState_ReCalling:
            case E_TeamState.E_TeamState_Returning:
            case E_TeamState.E_TeamState_Home:
               break;
            default:
               return null;
         }
         return "#0099ff";
      }
      
      public function get actionId() : int
      {
         return this.dto.actionId;
      }
      
      public function campareDto(param1:Dto_War_History) : Boolean
      {
         return this.roleInfo.roleId.compare(param1.activeInfo.roleInfo.roleId) && this.actionId == param1.actionId && this.teamId == param1.teamId;
      }
      
      public function campareVO(param1:MapInfoWarHistoryVO) : Boolean
      {
         return this.roleInfo.roleId.compare(param1.roleInfo.roleId) && this.actionId == param1.actionId && this.teamId == param1.teamId;
      }
      
      public function getCurrentCell() : Point
      {
         var _loc1_:Point = null;
         var _loc2_:Point = null;
         if(this.leftTime < 0)
         {
            return null;
         }
         _loc1_ = this.getPosFrom();
         _loc2_ = this.getPosTo();
         return Point.interpolate(_loc1_,_loc2_,this.leftTime / this.totalTime);
      }
      
      public function getPosFrom() : Point
      {
         if(this.isTeamBacking)
         {
            return this.targetInfo.pos.add(new Point(0.5,0.5));
         }
         return this.roleInfo.pos.add(new Point(0.5,0.5));
      }
      
      public function getPosTo() : Point
      {
         if(this.isTeamBacking)
         {
            return this.roleInfo.pos.add(new Point(0.5,0.5));
         }
         return this.targetInfo.pos.add(new Point(0.5,0.5));
      }
      
      private function get isTeamBacking() : Boolean
      {
         return this.teamState == E_TeamState.E_TeamState_ReCalling || this.teamState == E_TeamState.E_TeamState_Returning;
      }
   }
}

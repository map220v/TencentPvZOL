package com.qq.modules.map.model.vo
{
   import PVZ.Cmd.Cmd_War_DeclareWar_SC;
   import PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC;
   import PVZ.Cmd.Dto_WorldMap_CellInfo;
   import PVZ.Cmd.Dto_WorldMap_MineCar;
   import PVZ.Cmd.E_WarFreeType;
   import PVZ.Cmd.E_WarState;
   import com.qq.modules.main.model.PrivilegeDiamond;
   import com.qq.modules.mapinfo.model.vo.MapInfoWarHistoryVO;
   import com.qq.utils.DateUtils;
   import com.qq.utils.IconUtil;
   import com.tencent.protobuf.Int64;
   
   public class MapCityCellVO extends MapBasicCellVO
   {
       
      
      public var carts:Vector.<MapMineCartVO>;
      
      private var cmd_WorldMap_GetCityInfo_SC:Cmd_WorldMap_GetCityInfo_SC;
      
      private var _warHistory:Vector.<MapInfoWarHistoryVO>;
      
      public function MapCityCellVO(param1:Dto_WorldMap_CellInfo = null, param2:Int64 = null)
      {
         this.carts = new Vector.<MapMineCartVO>();
         this._warHistory = new Vector.<MapInfoWarHistoryVO>();
         _type = 1;
         super(param1,param2);
      }
      
      public function get isHaveCityInfo() : Boolean
      {
         return this.cmd_WorldMap_GetCityInfo_SC != null;
      }
      
      public function get warFree() : int
      {
         this.updateInternal();
         return dto.warFree;
      }
      
      public function get allianceName() : String
      {
         return !!dto.guildName ? dto.guildName : "";
      }
      
      public function get allianceId() : Int64
      {
         if(!dto)
         {
            return null;
         }
         return dto.guildId;
      }
      
      public function get hasAlliance() : Boolean
      {
         if(!this.cmd_WorldMap_GetCityInfo_SC)
         {
            return false;
         }
         return this.cmd_WorldMap_GetCityInfo_SC.guildId != null && !this.cmd_WorldMap_GetCityInfo_SC.guildId.isZero();
      }
      
      public function canDeclareWar(param1:Int64) : Boolean
      {
         if(isMine)
         {
            return false;
         }
         return !this.isSameAlliance(param1) && !this.isDeclaringWar() && !this.hasDeclaredWar(param1) && !this.canAttack(param1) && !this.hasWarForbid;
      }
      
      public function canRetreat(param1:Int64) : Boolean
      {
         if(isMine)
         {
            return false;
         }
         return false;
      }
      
      public function canReinforce(param1:Int64) : Boolean
      {
         if(isMine)
         {
            return false;
         }
         return this.isSameAlliance(param1);
      }
      
      public function canAttack(param1:Int64 = null) : Boolean
      {
         if(this.isSameAlliance(param1))
         {
            return false;
         }
         if(isMine || this.hasWarForbid)
         {
            return false;
         }
         this.updateInternal();
         return dto.warState == E_WarState.E_WarState_CanAttack;
      }
      
      public function canSendMail() : Boolean
      {
         if(isMine)
         {
            return false;
         }
         return !this.isMyCity();
      }
      
      public function get hasWarForbid() : Boolean
      {
         if(!dto)
         {
            return false;
         }
         this.updateInternal();
         return dto.warFree != E_WarFreeType.E_WarFreeType_None;
      }
      
      public function getgetTimeWarForbidEndLeft() : int
      {
         return dto.warFreeEndTime + 1 - DateUtils.getInstance().getServerTime();
      }
      
      public function getTimeWarDeclaringEnd() : int
      {
         return dto.stateEndTime + 1;
      }
      
      public function getgetTimeWarDeclaringEndLeft() : int
      {
         return this.getTimeWarDeclaringEnd() - DateUtils.getInstance().getServerTime();
      }
      
      public function isDeclaringWar() : Boolean
      {
         if(isMine)
         {
            return false;
         }
         this.updateInternal();
         return dto.warState == E_WarState.E_WarState_Declare || dto.warState == E_WarState.E_WarState_BeDeclared;
      }
      
      private function updateInternal() : void
      {
         if(dto == null)
         {
            return;
         }
         if(dto.warState == E_WarState.E_WarState_Declare || dto.warState == E_WarState.E_WarState_BeDeclared)
         {
            if(this.getgetTimeWarDeclaringEndLeft() < 0)
            {
               dto.warState = E_WarState.E_WarState_CanAttack;
            }
         }
         if(dto.warFree == E_WarFreeType.E_WarFreeType_Normal)
         {
            dto.warFree = this.getgetTimeWarForbidEndLeft() > 0 ? uint(E_WarFreeType.E_WarFreeType_Normal) : uint(E_WarFreeType.E_WarFreeType_None);
         }
      }
      
      public function hasDeclaredWar(param1:Int64 = null) : Boolean
      {
         return this.canAttack(param1);
      }
      
      public function isSameAlliance(param1:Int64 = null) : Boolean
      {
         if(!this.allianceId || !param1)
         {
            return false;
         }
         return this.allianceId.compare(param1);
      }
      
      public function isMyCity() : Boolean
      {
         return isMine;
      }
      
      public function get friendStatus() : int
      {
         if(!this.cmd_WorldMap_GetCityInfo_SC)
         {
            return 0;
         }
         return this.cmd_WorldMap_GetCityInfo_SC.firendStatus;
      }
      
      public function loadCmd_War_DeclareWar_SC(param1:Cmd_War_DeclareWar_SC) : void
      {
         dto.warState = E_WarState.E_WarState_Declare;
         dto.stateEndTime = param1.endTime;
      }
      
      public function get roleLevel() : int
      {
         if(!this.cmd_WorldMap_GetCityInfo_SC)
         {
            return 0;
         }
         return this.cmd_WorldMap_GetCityInfo_SC.roleLevel;
      }
      
      public function getWarHistory() : Vector.<MapInfoWarHistoryVO>
      {
         return this._warHistory;
      }
      
      public function loadCmd_WorldMap_GetCityInfo_SC(param1:Cmd_WorldMap_GetCityInfo_SC) : void
      {
         var _loc2_:int = 0;
         this.cmd_WorldMap_GetCityInfo_SC = param1;
         this._warHistory.length = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.warHistory.length)
         {
            this._warHistory.push(new MapInfoWarHistoryVO(param1.roleId,param1.warHistory[_loc2_]));
            _loc2_++;
         }
         _myWord = param1.signature;
         m_privilegeDiamond = PrivilegeDiamond.create(param1.diamond.flag,param1.diamond.diamondLevel);
      }
      
      public function get roleIcon() : String
      {
         if(this.cmd_WorldMap_GetCityInfo_SC == null)
         {
            return null;
         }
         return IconUtil.getFaceIcon(null,this.cmd_WorldMap_GetCityInfo_SC.faceId,this.cmd_WorldMap_GetCityInfo_SC.qqFaceURL,100);
      }
      
      override public function getTip(param1:int) : String
      {
         var _loc2_:String = getMapName(param1);
         return "镇长：" + roleName + "\n" + "联盟：" + this.allianceName + "\n" + "坐标：" + pos.x + ", " + pos.y + "\n" + "所在：" + _loc2_;
      }
      
      override public function loadDto(param1:Dto_WorldMap_CellInfo) : void
      {
         var _loc2_:int = 0;
         super.loadDto(param1);
         this.carts.length = 0;
         if(param1.mineCar)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.mineCar.length)
            {
               this.addCartByDto(param1.mineCar[_loc2_]);
               _loc2_++;
            }
         }
      }
      
      public function addCartByDto(param1:Dto_WorldMap_MineCar) : MapMineCartVO
      {
         var _loc2_:MapMineCartVO = new MapMineCartVO(param1,this);
         this.carts.push(_loc2_);
         return _loc2_;
      }
      
      public function removeCartAt(param1:int, param2:int) : MapMineCartVO
      {
         var _loc3_:int = 0;
         var _loc4_:MapMineCartVO = null;
         _loc3_ = 0;
         while(_loc3_ < this.carts.length)
         {
            if((_loc4_ = this.carts[_loc3_]).pos.x == param1 && _loc4_.pos.y == param2)
            {
               this.carts.splice(_loc3_,1);
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getCartAt(param1:int, param2:int) : MapMineCartVO
      {
         var _loc3_:int = 0;
         var _loc4_:MapMineCartVO = null;
         _loc3_ = 0;
         while(_loc3_ < this.carts.length)
         {
            if((_loc4_ = this.carts[_loc3_]).pos.x == param1 && _loc4_.pos.y == param2)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
   }
}

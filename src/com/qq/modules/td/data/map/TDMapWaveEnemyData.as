package com.qq.modules.td.data.map
{
   import com.qq.modules.td.model.vo.TDPathVO;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import com.qq.utils.DMath;
   
   public class TDMapWaveEnemyData
   {
       
      
      public var type:int;
      
      public var delay:int;
      
      public var randomRodeIDList:Array;
      
      public var hasFuel:Boolean;
      
      public var useSpars:Boolean;
      
      public var dropCard:int;
      
      public var groupId:String;
      
      public var hasWind:Boolean;
      
      public var windEndRow:int;
      
      public var isDrillOut:Boolean;
      
      public var drillOutCol:int;
      
      public var param:XML;
      
      private var path:TDPathVO;
      
      private var _roadIndex:int;
      
      public var startCol:int;
      
      public var pathId:int;
      
      public function TDMapWaveEnemyData(param1:XML = null)
      {
         var _loc2_:int = 0;
         super();
         if(param1)
         {
            this.type = int(param1.@type);
            this.delay = int(param1.@delay);
            this.randomRodeIDList = String(param1.@road).split(";");
            this.groupId = String(param1.@groupId);
            this.hasFuel = int(param1.@hasFuel) == 1;
            this.useSpars = int(param1.@useSpars) == 1;
            this.dropCard = int(param1.@dropCard);
            this.windEndRow = int(param1.@windEndRow);
            this.startCol = !!param1.hasOwnProperty("@startCol") ? int(int(param1.@startCol)) : -1;
            this.pathId = int(param1.@pathId);
            this.hasWind = this.windEndRow != 0;
            this.drillOutCol = !!param1.hasOwnProperty("@drillOutCol") ? int(int(param1.@drillOutCol)) : -1;
            this.isDrillOut = this.drillOutCol >= 0;
            this.param = param1.param[0];
         }
      }
      
      public function get roadIndex() : int
      {
         return this._roadIndex;
      }
      
      public function set roadIndex(param1:int) : void
      {
         this._roadIndex = param1;
      }
      
      public function getPath() : TDPathVO
      {
         return this.path;
      }
      
      public function initBeforeCreateZombie() : void
      {
         var _loc1_:int = 0;
         if(this.pathId > 0)
         {
            this.path = TDFloorManager.instance.getPathVO(this.pathId);
            if(this.path)
            {
               this.roadIndex = this.path.roadIndex;
            }
         }
         else if(this.randomRodeIDList)
         {
            _loc1_ = DMath.randNum(0,Math.max(0,this.randomRodeIDList.length - 1));
            this.roadIndex = this.randomRodeIDList[_loc1_];
            this.path = new TDPathVO(null,this.roadIndex);
         }
         else
         {
            this.path = new TDPathVO(null,this.roadIndex);
         }
      }
   }
}

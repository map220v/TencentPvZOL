package com.qq.modules.embattle.model
{
   import asgui.controls.Image;
   import com.qq.display.EmbattlePlant;
   import com.qq.modules.dummy.view.DummyLineupView;
   import com.qq.modules.embattle.view.EmbattleView;
   import com.qq.modules.embattle.view.control.CityBuildingMouseCtr;
   import com.tencent.protobuf.Int64;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import org.robotlegs.mvcs.Actor;
   
   public class EmbattleModel extends Actor
   {
      
      private static var _instance:EmbattleModel;
       
      
      public var cityBuilding:MovieClip;
      
      public var embattleView:EmbattleView;
      
      public var cityBuildDefPos:Point;
      
      public var cityBuildingScale:Number;
      
      public var cityBuildingMouseCtr:CityBuildingMouseCtr;
      
      public var cityEmbattlePlantList_home:Vector.<EmbattlePlant>;
      
      public var cityEmbattlePlantList_other:Vector.<EmbattlePlant>;
      
      public var cityDummy:DummyLineupView;
      
      public var cityBuildingHolder:MovieClip;
      
      public var cityBuildingView:Image;
      
      public var isCityBuildingZoomOut:Boolean = false;
      
      private var _dragingPlant:EmbattlePlant;
      
      public var dragingCardId:Int64;
      
      private var _embattleMode:int;
      
      public var mapChildType:int;
      
      public var mapTargetPoint:Point;
      
      public var warType:uint;
      
      public var warTimeCost:Number;
      
      public var canFight:Boolean;
      
      public var historyLineupIndex:int;
      
      public var onBattleBackFunc:Function;
      
      public var onBattleBackParam:Array;
      
      public var onBattleCloseFunc:Function;
      
      public var onBattleCloseParam:Array;
      
      public var hasEmbattleView:Boolean;
      
      public var isPlantDraging:Boolean = false;
      
      public function EmbattleModel()
      {
         this.cityBuildDefPos = new Point();
         super();
      }
      
      public static function getInstance() : EmbattleModel
      {
         if(_instance == null)
         {
            _instance = new EmbattleModel();
         }
         return _instance;
      }
      
      public function get embattleMode() : int
      {
         return this._embattleMode;
      }
      
      public function set embattleMode(param1:int) : void
      {
         this._embattleMode = param1;
      }
      
      public function get dragingPlant() : EmbattlePlant
      {
         if(!this._dragingPlant)
         {
            this._dragingPlant = new EmbattlePlant();
            this._dragingPlant.Scale = 1.3;
         }
         return this._dragingPlant;
      }
      
      public function set dragingPlant(param1:EmbattlePlant) : void
      {
         this._dragingPlant = param1;
      }
   }
}

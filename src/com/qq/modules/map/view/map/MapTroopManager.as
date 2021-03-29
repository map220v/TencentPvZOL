package com.qq.modules.map.view.map
{
   import asgui.core.Application;
   import com.qq.modules.mapinfo.model.vo.MapInfoWarHistoryVO;
   import flash.events.Event;
   import org.allencuilib.map.roles.MapRoleStage;
   
   public class MapTroopManager
   {
      
      private static var _instance:MapTroopManager;
       
      
      private var roleStage:MapRoleStage;
      
      private var mediator:MapViewMediator;
      
      private var troops:Vector.<MapTroopRole>;
      
      public function MapTroopManager()
      {
         this.troops = new Vector.<MapTroopRole>();
         super();
         Application.application.addEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
      }
      
      public static function get instance() : MapTroopManager
      {
         if(!_instance)
         {
            _instance = new MapTroopManager();
         }
         return _instance;
      }
      
      public function Dispose() : void
      {
         Application.application.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         this.roleStage = null;
         _instance = null;
      }
      
      public function init(param1:MapViewMediator) : void
      {
         this.mediator = param1;
         this.roleStage = param1.view.stg.roleStage;
      }
      
      protected function enterFrameHandler(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:MapTroopRole = null;
         _loc2_ = 0;
         while(_loc2_ < this.troops.length)
         {
            _loc3_ = this.troops[_loc2_];
            if(_loc3_.hasDisposed)
            {
               this.troops.splice(_loc2_,1);
               _loc2_--;
            }
            else
            {
               _loc3_.advanceTime();
            }
            _loc2_++;
         }
      }
      
      public function update(param1:Vector.<MapInfoWarHistoryVO>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:MapTroopRole = null;
         var _loc5_:MapInfoWarHistoryVO = null;
         if(this.roleStage == null)
         {
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < this.troops.length)
         {
            if(_loc4_ = this.troops[_loc2_])
            {
               if(_loc4_.hasDisposed)
               {
                  this.troops.splice(_loc2_,1);
                  _loc2_--;
               }
               else
               {
                  _loc3_ = 0;
                  while(_loc3_ < param1.length)
                  {
                     if((_loc5_ = param1[_loc3_]).campareVO(_loc4_.vo))
                     {
                        _loc4_.loadVO(param1[_loc3_]);
                        break;
                     }
                     _loc3_++;
                  }
                  if(_loc3_ == param1.length)
                  {
                     this.roleStage.removeChild(_loc4_);
                     _loc4_.Dispose();
                     this.troops.splice(_loc2_,1);
                     _loc2_--;
                  }
               }
            }
            _loc2_++;
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc5_ = param1[_loc3_];
            _loc2_ = 0;
            while(_loc2_ < this.troops.length)
            {
               if((_loc4_ = this.troops[_loc2_]) != null)
               {
                  if(_loc5_.campareVO(_loc4_.vo))
                  {
                     break;
                  }
               }
               _loc2_++;
            }
            if(_loc2_ == this.troops.length)
            {
               (_loc4_ = new MapTroopRole()).loadVO(param1[_loc3_]);
               this.roleStage.addChild(_loc4_);
               this.troops.push(_loc4_);
            }
            _loc3_++;
         }
      }
   }
}

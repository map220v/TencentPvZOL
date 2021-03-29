package org.allencuilib.map.roles
{
   import asgui.core.IDisposable;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import org.allencuilib.map.events.MapRoleEvent;
   import org.allencuilib.map.interfaces.IMapRole;
   
   public class MapRoleStage extends Sprite implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var _roles:Vector.<IMapRole>;
      
      public var ifDrawingMainRoleTrack:Boolean;
      
      private var _mainRole:IMapRole;
      
      private var _overRole:IMapRole;
      
      private var overValidated:Boolean;
      
      private var enterFrameCounter:int;
      
      public function MapRoleStage()
      {
         this._roles = new Vector.<IMapRole>();
         super();
         this.addEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
      }
      
      public function Dispose() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
         if(this._mainRole)
         {
            this._mainRole.removeEventListener(MapRoleEvent.POSITION_CHANGED,this.MainRolePositionChangeHandler);
            this._mainRole.removeEventListener(MapRoleEvent.TARGET_CHANGED,this.MainRoleTargetChangeHandler);
         }
         this.Clear();
         this._disposed = true;
      }
      
      public function Clear() : void
      {
         while(this.roles.length > 0)
         {
            this.RemoveRoleAt(0).Dispose();
         }
         while(this.numChildren > 0)
         {
            (this.removeChildAt(0) as IMapRole).Dispose();
         }
         this._mainRole = null;
         this.graphics.clear();
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get roles() : Vector.<IMapRole>
      {
         return this._roles;
      }
      
      public function GetRoleByPixel(param1:Number, param2:Number) : IMapRole
      {
         var _loc3_:int = 0;
         var _loc4_:IMapRole = null;
         var _loc5_:uint = 0;
         var _loc6_:int;
         _loc3_ = (_loc6_ = this.roles.length) - 1;
         while(_loc3_ >= 0)
         {
            if((_loc5_ = (_loc4_ = this.roles[_loc3_] as IMapRole).GetPixelAt(param1 - _loc4_.x,param2 - _loc4_.y)) > 1426063360)
            {
               return _loc4_;
            }
            _loc3_--;
         }
         return null;
      }
      
      public function GetRoleByName(param1:String) : IMapRole
      {
         return this.getChildByName(param1) as IMapRole;
      }
      
      public function AddRole(param1:IMapRole) : IMapRole
      {
         if(this.Contains(param1))
         {
            return null;
         }
         this._roles.push(param1);
         return this.addChild(param1 as DisplayObject) as IMapRole;
      }
      
      public function RemoveRole(param1:IMapRole) : IMapRole
      {
         var _loc2_:int = 0;
         var _loc3_:IMapRole = null;
         var _loc4_:int = this._roles.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc3_ = this._roles[_loc2_] as IMapRole;
            if(_loc3_ == param1)
            {
               this._roles.splice(_loc2_,1);
               if((_loc3_ as DisplayObject).parent != null)
               {
                  (_loc3_ as DisplayObject).parent.removeChild(_loc3_ as DisplayObject);
               }
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function RemoveRoleAt(param1:int) : IMapRole
      {
         var _loc2_:DisplayObject = null;
         if(this._roles[param1] != null)
         {
            _loc2_ = this._roles.splice(param1,1)[0] as DisplayObject;
            if(_loc2_.parent != null)
            {
               _loc2_.parent.removeChild(_loc2_);
            }
            return _loc2_ as IMapRole;
         }
         return null;
      }
      
      public function Contains(param1:IMapRole) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:IMapRole = null;
         var _loc4_:int = this._roles.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc3_ = this._roles[_loc2_] as IMapRole;
            if(_loc3_ == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function get mainRole() : IMapRole
      {
         return this._mainRole;
      }
      
      public function set mainRole(param1:IMapRole) : void
      {
         if(this._mainRole == param1)
         {
            return;
         }
         this._mainRole = param1;
         if(this._mainRole)
         {
            this._mainRole.addEventListener(MapRoleEvent.POSITION_CHANGED,this.MainRolePositionChangeHandler);
            this._mainRole.addEventListener(MapRoleEvent.TARGET_CHANGED,this.MainRoleTargetChangeHandler);
         }
      }
      
      public function get overRole() : IMapRole
      {
         if(!this.overValidated)
         {
            this.$UpdateOver();
            this.overValidated = true;
         }
         return this._overRole;
      }
      
      public function UpdateOver() : void
      {
         this.$UpdateOver();
      }
      
      private function $UpdateOver() : void
      {
         var _loc2_:MapRoleEvent = null;
         var _loc1_:IMapRole = this.GetRoleByPixel(mouseX,mouseY);
         if(_loc1_ != this._overRole)
         {
            _loc2_ = new MapRoleEvent(MapRoleEvent.OVER_CHANGED);
            _loc2_.role = _loc1_;
            _loc2_.lastRole = this._overRole;
            this.dispatchEvent(_loc2_);
            this._overRole = _loc1_;
         }
      }
      
      public function UpdateDepth() : void
      {
         var _loc3_:IMapRole = null;
         var _loc1_:int = 0;
         var _loc2_:int = this.numChildren;
         while(_loc2_ > 1)
         {
            _loc3_ = this.getChildAt(0) as IMapRole;
            _loc1_ = 1;
            while(_loc1_ < _loc2_)
            {
               if((this.getChildAt(_loc1_) as IMapRole).depth >= _loc3_.depth)
               {
                  _loc3_ = this.getChildAt(_loc1_) as IMapRole;
               }
               _loc1_++;
            }
            if(_loc3_ != this.getChildAt(_loc2_ - 1))
            {
               this.swapChildren(_loc3_ as DisplayObject,this.getChildAt(_loc2_ - 1));
            }
            _loc2_--;
         }
      }
      
      private function MainRolePositionChangeHandler(param1:MapRoleEvent) : void
      {
         this.dispatchEvent(param1.clone());
      }
      
      private function MainRoleTargetChangeHandler(param1:MapRoleEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Point = null;
         if(this.ifDrawingMainRoleTrack)
         {
            this.graphics.clear();
            this.graphics.lineStyle(2,16711680);
            this.graphics.moveTo(this.mainRole.x,this.mainRole.y);
            this.graphics.lineTo(this.mainRole.targetX,this.mainRole.targetY);
            this.graphics.drawCircle(this.mainRole.targetX,this.mainRole.targetY,3);
            _loc2_ = 0;
            while(_loc2_ < this.mainRole.microTargets.length)
            {
               _loc3_ = this.mainRole.microTargets[_loc2_] as Point;
               this.graphics.lineTo(_loc3_.x,_loc3_.y);
               this.graphics.drawCircle(_loc3_.x,_loc3_.y,3);
               _loc2_++;
            }
         }
         this.dispatchEvent(param1.clone());
      }
      
      private function EnterFrameHandler(param1:Event) : void
      {
         this.UpdateOver();
         if(this.enterFrameCounter++ % 10 == 0)
         {
            this.UpdateDepth();
         }
      }
   }
}

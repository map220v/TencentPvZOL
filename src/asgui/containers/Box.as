package asgui.containers
{
   import asgui.containers.boxes.BoxDirection;
   import asgui.core.Align;
   import asgui.core.Container;
   import flash.display.DisplayObject;
   
   public class Box extends Container
   {
      
      public static const STYLE:String = "Box";
       
      
      private var _direction:String = "vertical";
      
      public function Box()
      {
         super();
         absoluteLayout = false;
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      public function get direction() : String
      {
         return this._direction;
      }
      
      public function set direction(param1:String) : void
      {
         if(this._direction == param1)
         {
            return;
         }
         this._direction = param1;
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         InvalidateDisplayList();
         super.setChildIndex(param1,param2);
      }
      
      override public function swapChildren(param1:DisplayObject, param2:DisplayObject) : void
      {
         InvalidateDisplayList();
         super.swapChildren(param1,param2);
      }
      
      override public function swapChildrenAt(param1:int, param2:int) : void
      {
         InvalidateDisplayList();
         super.swapChildrenAt(param1,param2);
      }
      
      override public function ValidateDisplayList() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:DisplayObject = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(invalidateDisplayListFlag)
         {
            _loc2_ = 0;
            _loc3_ = this.styleDeclaration.horizontalGap;
            _loc4_ = this.styleDeclaration.verticalGap;
            _loc5_ = this.styleDeclaration.verticalAlign;
            _loc6_ = this.styleDeclaration.horizontalAlign;
            _loc7_ = this.numChildren;
            _loc8_ = styleDeclaration.paddingTop;
            _loc9_ = styleDeclaration.paddingLeft;
            _loc11_ = this.displayWidth;
            _loc12_ = this.displayHeight;
            if(this.direction == BoxDirection.VERTICAL)
            {
               _loc2_ = _loc8_;
               _loc1_ = 0;
               while(_loc1_ < _loc7_)
               {
                  _loc10_ = this.getChildAt(_loc1_);
                  switch(_loc6_)
                  {
                     case Align.LEFT:
                        _loc10_.x = _loc9_ + 0;
                        break;
                     case Align.HCENTER:
                        _loc10_.x = (_loc11_ - _loc10_.width) / 2;
                        break;
                     case Align.RIGHT:
                        _loc10_.x = _loc11_ - _loc10_.width;
                        break;
                  }
                  if(_loc10_.x < 0)
                  {
                     _loc10_.x = 0;
                  }
                  _loc10_.y = _loc2_;
                  _loc2_ = _loc10_.y + _loc10_.height + _loc4_;
                  _loc1_++;
               }
               _loc2_ -= _loc4_;
               switch(_loc5_)
               {
                  case Align.VCENTER:
                     _loc14_ = (_loc12_ - _loc2_) / 2;
                     break;
                  case Align.BOTTOM:
                     _loc14_ = _loc12_ - _loc2_;
               }
               if(_loc14_ > 0)
               {
                  _loc1_ = 0;
                  while(_loc1_ < _loc7_)
                  {
                     _loc10_ = this.getChildAt(_loc1_);
                     _loc10_.y += _loc14_;
                     _loc1_++;
                  }
               }
            }
            else if(this.direction == BoxDirection.HORIZONTAL)
            {
               _loc2_ = _loc9_;
               _loc1_ = 0;
               while(_loc1_ < _loc7_)
               {
                  _loc10_ = this.getChildAt(_loc1_);
                  switch(_loc5_)
                  {
                     case Align.TOP:
                        _loc10_.y = _loc8_ + 0;
                        break;
                     case Align.VCENTER:
                        _loc10_.y = (_loc12_ - _loc10_.height) / 2;
                        break;
                     case Align.BOTTOM:
                        _loc10_.y = _loc12_ - _loc10_.height;
                        break;
                  }
                  if(_loc10_.y < 0)
                  {
                     _loc10_.y = 0;
                  }
                  _loc10_.x = _loc2_;
                  _loc2_ = _loc10_.x + _loc10_.width + _loc3_;
                  _loc1_++;
               }
               _loc2_ -= _loc3_;
               switch(_loc6_)
               {
                  case Align.HCENTER:
                     _loc13_ = (_loc11_ - _loc2_) / 2;
                     break;
                  case Align.RIGHT:
                     _loc13_ = _loc11_ - _loc2_;
               }
               if(_loc13_ > 0)
               {
                  _loc1_ = 0;
                  while(_loc1_ < _loc7_)
                  {
                     _loc10_ = this.getChildAt(_loc1_);
                     _loc10_.x += _loc13_;
                     _loc1_++;
                  }
               }
            }
         }
         super.ValidateDisplayList();
      }
   }
}

package asgui.controls.lists
{
   import asgui.controls.ButtonPager;
   import asgui.controls.scrolls.ScrollBar;
   import asgui.core.DataProvider;
   import asgui.core.IContainer;
   import asgui.core.IListItemRenderer;
   import asgui.core.IPager;
   import asgui.core.ScrollControlBase;
   import asgui.events.AsguiEvent;
   import asgui.events.DataProviderEvent;
   import asgui.events.ListEvent;
   import asgui.strings.SS;
   import asgui.styles.StyleManager;
   import asgui.styles.StyleSkin;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class ListBase extends ScrollControlBase implements IContainer
   {
       
      
      protected var headItems:Vector.<IListItemRenderer>;
      
      protected var items:Vector.<Vector.<IListItemRenderer>>;
      
      protected var columns:Vector.<ListColumn>;
      
      protected var $headerBackgroundSkin:StyleSkin;
      
      protected var $footerBackgroundSkin:StyleSkin;
      
      protected var $headerCellSkin:StyleSkin;
      
      protected var $cellSkin:StyleSkin;
      
      public var pager:IPager;
      
      private var _turningOption:String;
      
      private var _pagerClass:Class;
      
      private var _dataProvider:DataProvider;
      
      private var dataProviderChanged:Boolean = false;
      
      private var dataProviderUserSetted:Boolean = false;
      
      private var _selectable:Boolean = true;
      
      private var _rowHeight:int = 20;
      
      private var rowHeightChanged:Boolean = false;
      
      private var lastOverRowIndex:int = -1;
      
      private var _allowMultipleSelection:Boolean = false;
      
      private var _selectionIndices:Array;
      
      private var columnsChanged:Boolean;
      
      public function ListBase()
      {
         this.headItems = new Vector.<IListItemRenderer>();
         this.items = new Vector.<Vector.<IListItemRenderer>>();
         this.columns = new Vector.<ListColumn>();
         this._turningOption = ListTurningOption.SCROLL;
         this._pagerClass = ButtonPager;
         this._selectionIndices = [];
         super();
      }
      
      override public function Dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         contentPane.removeEventListener(MouseEvent.MOUSE_MOVE,this.ContentMouseMoveHandler);
         contentPane.removeEventListener(MouseEvent.MOUSE_OVER,this.ContentMouseOverHandler);
         contentPane.removeEventListener(MouseEvent.MOUSE_OUT,this.ContentMouseOutHandler);
         contentPane.removeEventListener(MouseEvent.CLICK,this.ContentClickHandler);
         contentPane.removeEventListener(MouseEvent.MOUSE_DOWN,this.ContentDownHandler);
         contentPane.removeEventListener(MouseEvent.DOUBLE_CLICK,this.ContentDoubleClickHandler);
         if(this.pager)
         {
            this.pager.removeEventListener(Event.CHANGE,this.PagerChangeHandler);
            this.pager.Dispose();
            this.pager = null;
         }
         _loc1_ = 0;
         while(_loc1_ < this.items.length)
         {
            _loc2_ = 0;
            while(_loc2_ < this.items[_loc1_].length)
            {
               if(this.items[_loc1_][_loc2_])
               {
                  if((this.columns[_loc2_] as ListColumn).itemRendererDisposeFunction != null)
                  {
                     ((this.columns[_loc2_] as ListColumn).itemRendererDisposeFunction as Function)(this.items[_loc1_][_loc2_] as IListItemRenderer,this.startIndexByPage + _loc1_,_loc2_);
                  }
                  (this.items[_loc1_][_loc2_] as IListItemRenderer).Dispose();
               }
               _loc2_++;
            }
            _loc1_++;
         }
         this.items = null;
         while(this.headItems.length > this.columnCount)
         {
            (removeChild(this.headItems.pop() as DisplayObject) as IListItemRenderer).Dispose();
         }
         this.headItems = null;
         while(this.columns.length > 0)
         {
            (this.columns.pop() as ListColumn).Dispose();
         }
         while(contentPane.numChildren > 0)
         {
            contentPane.removeChildAt(0);
         }
         if(this._dataProvider)
         {
            this._dataProvider.removeEventListener(DataProviderEvent.DATA_CHANGE,this.DataProviderChangeHandler);
            this._dataProvider.removeEventListener(DataProviderEvent.CURRENT_PAGE_CHANGE,this.DataProviderPageChangeHandler);
         }
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         contentPane.addEventListener(MouseEvent.MOUSE_OVER,this.ContentMouseOverHandler);
         contentPane.addEventListener(MouseEvent.MOUSE_OUT,this.ContentMouseOutHandler);
         contentPane.addEventListener(MouseEvent.CLICK,this.ContentClickHandler);
         contentPane.addEventListener(MouseEvent.MOUSE_DOWN,this.ContentDownHandler);
         contentPane.addEventListener(MouseEvent.DOUBLE_CLICK,this.ContentDoubleClickHandler);
      }
      
      override public function OnAddedToStage() : void
      {
         this.CheckColumns();
         super.OnAddedToStage();
      }
      
      override public function set doubleClickEnabled(param1:Boolean) : void
      {
         contentPane.doubleClickEnabled = param1;
      }
      
      public function get getAbsoluteLayout() : Boolean
      {
         return false;
      }
      
      public function Refresh() : void
      {
         this.dataProviderChanged = true;
         InvalidateProperties();
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      public function AddColumn(param1:ListColumn) : void
      {
         this.columns.push(param1);
         this.InvalidateColumns();
      }
      
      public function RemoveColumn(param1:ListColumn) : ListColumn
      {
         return this.RemoveColumnAt(this.GetColumnIndex(param1));
      }
      
      public function RemoveColumnAt(param1:int) : ListColumn
      {
         var _loc2_:ListColumn = null;
         if(param1 >= 0 && param1 < this.columns.length)
         {
            _loc2_ = this.columns.splice(param1,1)[0] as ListColumn;
            _loc2_.Dispose();
            this.InvalidateColumns();
            return _loc2_;
         }
         return null;
      }
      
      public function GetColumnIndex(param1:ListColumn) : int
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.columns.length)
         {
            if(this.columns[_loc2_] == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function GetColumnAt(param1:int) : ListColumn
      {
         if(param1 >= this.columns.length)
         {
            return null;
         }
         return this.columns[param1];
      }
      
      public function get turningOption() : String
      {
         return this._turningOption;
      }
      
      public function set turningOption(param1:String) : void
      {
         this._turningOption = param1;
      }
      
      public function get pagerClass() : Class
      {
         return this._pagerClass;
      }
      
      public function set pagerClass(param1:Class) : void
      {
         this._pagerClass = param1;
      }
      
      public function get dataProvider() : Object
      {
         if(this.dataProviderUserSetted)
         {
            return this._dataProvider;
         }
         return this._dataProvider.data;
      }
      
      public function set dataProvider(param1:Object) : void
      {
         if(this._dataProvider)
         {
            this._dataProvider.removeEventListener(DataProviderEvent.DATA_CHANGE,this.DataProviderChangeHandler);
            this._dataProvider.removeEventListener(DataProviderEvent.CURRENT_PAGE_CHANGE,this.DataProviderPageChangeHandler);
         }
         if(param1 is DataProvider)
         {
            this._dataProvider = param1 as DataProvider;
            this._dataProvider.addEventListener(DataProviderEvent.DATA_CHANGE,this.DataProviderChangeHandler);
            this._dataProvider.addEventListener(DataProviderEvent.CURRENT_PAGE_CHANGE,this.DataProviderPageChangeHandler);
            this.dataProviderUserSetted = true;
         }
         else
         {
            this._dataProvider = new DataProvider();
            this._dataProvider.data = param1;
            this._dataProvider.addEventListener(DataProviderEvent.DATA_CHANGE,this.DataProviderChangeHandler);
            this._dataProvider.addEventListener(DataProviderEvent.CURRENT_PAGE_CHANGE,this.DataProviderPageChangeHandler);
            this.dataProviderUserSetted = false;
         }
         this.Refresh();
         this.dispatchEvent(new AsguiEvent(AsguiEvent.DATA_CHANGE));
      }
      
      public function get selectable() : Boolean
      {
         return this._selectable;
      }
      
      public function set selectable(param1:Boolean) : void
      {
         if(this._selectable != param1)
         {
            this._selectable = param1;
            if(this._selectable == false && this.selectionIndices.length > 0)
            {
               this.selectionIndices = [];
               this.$DrawGrid();
            }
         }
      }
      
      public function get rowHeight() : int
      {
         return this._rowHeight;
      }
      
      public function set rowHeight(param1:int) : void
      {
         if(this._rowHeight != param1)
         {
            this._rowHeight = param1;
            this.rowHeightChanged = true;
            InvalidateProperties();
            InvalidateSize();
            InvalidateDisplayList();
         }
      }
      
      public function get rowHeightWithCss() : int
      {
         var _loc1_:int = !!this.styleDeclaration ? int(this.styleDeclaration.verticalGap) : 0;
         return this.rowHeight + _loc1_;
      }
      
      public function get rowCount() : int
      {
         if(this._dataProvider == null)
         {
            return 0;
         }
         return this._dataProvider.rowCount;
      }
      
      public function get overRowIndex() : int
      {
         var _loc1_:int = int(contentPane.mouseY / this.rowHeightWithCss);
         return _loc1_ >= this.rowCount ? -1 : int(_loc1_);
      }
      
      public function get columnCount() : int
      {
         return this.columns.length;
      }
      
      public function get overColumnIndex() : int
      {
         var _loc1_:int = 0;
         _loc1_ = this.columns.length - 1;
         while(_loc1_ >= 0)
         {
            if(contentPane.mouseX > (this.columns[_loc1_] as ListColumn).x)
            {
               break;
            }
            _loc1_--;
         }
         return _loc1_;
      }
      
      public function get overItem() : IListItemRenderer
      {
         if(this.overRowIndex == -1 || this.overColumnIndex == -1)
         {
            return null;
         }
         return this.items[this.overRowIndex][this.overColumnIndex] as IListItemRenderer;
      }
      
      public function get allowMultipleSelection() : Boolean
      {
         return this._allowMultipleSelection;
      }
      
      public function set allowMultipleSelection(param1:Boolean) : void
      {
         if(this._allowMultipleSelection != param1)
         {
            this._allowMultipleSelection = param1;
            InvalidateSize();
         }
      }
      
      public function get selectionIndices() : Array
      {
         while(this._selectionIndices[this._selectionIndices.length - 1] > this.rowCount - 1)
         {
            this._selectionIndices.pop();
         }
         return this._selectionIndices;
      }
      
      public function set selectionIndices(param1:Array) : void
      {
         if(this._selectionIndices != param1)
         {
            this._selectionIndices = param1;
            InvalidateSize();
         }
      }
      
      public function get selectedIndex() : int
      {
         if(this._selectionIndices.length > 0)
         {
            return this._selectionIndices[0];
         }
         return -1;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         this.selectionIndices = [param1];
      }
      
      public function get selectedItem() : Object
      {
         return this._dataProvider.GetRow(this.selectedIndex);
      }
      
      protected function get startIndexByPage() : int
      {
         if(this._dataProvider)
         {
            return this._dataProvider.itemsPerPage * (this._dataProvider.currentPage - 1);
         }
         return 0;
      }
      
      protected function CheckColumns() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.columns.length)
         {
            (this.columns[_loc2_] as ListColumn).x = _loc1_;
            _loc1_ += (this.columns[_loc2_] as ListColumn).columnWidth;
            _loc2_++;
         }
      }
      
      protected function $DrawGrid() : void
      {
         var _loc2_:Point = null;
         var _loc6_:int = 0;
         var _loc8_:ListColumn = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(disposing || this.dataProviderChanged || this.columnsChanged)
         {
            return;
         }
         var _loc1_:int = styleDeclaration.headerHeight;
         _loc2_ = scrollHandler.contentHolderChildrenSize;
         var _loc3_:int = this.columnCount;
         var _loc4_:int = this.lastOverRowIndex;
         var _loc5_:int = Math.max(_loc2_.x,displayWidth);
         _loc6_ = Math.max(_loc2_.y,displayHeight);
         var _loc7_:int = int(_loc6_ / this.rowHeight);
         var _loc11_:StyleSkin = StyleManager.GetStyleSkin(styleDeclaration.oddLineSkin);
         var _loc12_:StyleSkin = StyleManager.GetStyleSkin(styleDeclaration.evenLineSkin);
         var _loc13_:StyleSkin = StyleManager.GetStyleSkin(styleDeclaration.lineSkin);
         var _loc14_:StyleSkin = StyleManager.GetStyleSkin(styleDeclaration.rollOverLineSkin);
         var _loc15_:StyleSkin = StyleManager.GetStyleSkin(styleDeclaration.selectionLineSkin);
         contentPane.x = styleDeclaration.paddingLeft;
         contentPane.y = styleDeclaration.paddingTop + _loc1_;
         contentPane.graphics.clear();
         contentPane.graphics.beginFill(styleDeclaration.backgroundColor,styleDeclaration.backgroundAlpha);
         contentPane.graphics.drawRect(0,0,_loc5_,_loc6_);
         contentPane.graphics.endFill();
         if(this.items.length < _loc7_)
         {
            this.items.length = _loc7_;
         }
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            if(this.items[_loc9_] == null)
            {
               this.items[_loc9_] = new Vector.<IListItemRenderer>();
            }
            contentPane.graphics.lineStyle();
            if((_loc9_ + 1) % 2 == 1)
            {
               if(_loc11_)
               {
                  _loc11_.Draw(contentPane.graphics,_loc5_,this.rowHeight,true,0,this.rowHeightWithCss * _loc9_);
               }
               else if(_loc13_)
               {
                  _loc13_.Draw(contentPane.graphics,_loc5_,this.rowHeight,true,0,this.rowHeightWithCss * _loc9_);
               }
               else if(styleDeclaration.oddLineBackgroundAlpha > 0)
               {
                  contentPane.graphics.beginFill(styleDeclaration.oddLineBackgroundColor,styleDeclaration.oddLineBackgroundAlpha);
                  contentPane.graphics.drawRect(0,this.rowHeightWithCss * _loc9_,_loc5_,this.rowHeight);
               }
            }
            else if(_loc12_)
            {
               _loc12_.Draw(contentPane.graphics,_loc5_,this.rowHeight,true,0,this.rowHeightWithCss * _loc9_);
            }
            else if(_loc13_)
            {
               _loc13_.Draw(contentPane.graphics,_loc5_,this.rowHeight,true,0,this.rowHeightWithCss * _loc9_);
            }
            else if(styleDeclaration.evenLineBackgroundAlpha > 0)
            {
               contentPane.graphics.beginFill(styleDeclaration.evenLineBackgroundColor,styleDeclaration.evenLineBackgroundAlpha);
               contentPane.graphics.drawRect(0,this.rowHeightWithCss * _loc9_,_loc5_,this.rowHeight);
            }
            if(styleDeclaration.horizontalGridLines)
            {
               contentPane.graphics.lineStyle(styleDeclaration.verticalGap,styleDeclaration.horizontalGridLineColor);
               contentPane.graphics.moveTo(0,this.rowHeightWithCss * (_loc9_ + 1));
               contentPane.graphics.lineTo(_loc5_,this.rowHeightWithCss * (_loc9_ + 1));
            }
            _loc10_ = 0;
            while(_loc10_ < _loc3_)
            {
               if(this.items[_loc9_].length < _loc3_)
               {
                  this.items[_loc9_].length = _loc3_;
               }
               if(this.items[_loc9_] != null && this.items[_loc9_][_loc10_] != null)
               {
                  (this.items[_loc9_][_loc10_] as IListItemRenderer).width = (this.columns[_loc10_] as ListColumn).columnWidth;
                  (this.items[_loc9_][_loc10_] as IListItemRenderer).height = this.rowHeight;
                  if(this.items[_loc9_][_loc10_] is ListTextField)
                  {
                     styleDeclaration.SetTextFieldStyle(this.items[_loc9_][_loc10_] as ListTextField,false);
                  }
               }
               _loc10_++;
            }
            _loc9_++;
         }
         if(styleDeclaration.verticalGridLines)
         {
            _loc10_ = 1;
            while(_loc10_ < _loc3_)
            {
               _loc8_ = this.columns[_loc10_];
               contentPane.graphics.lineStyle(styleDeclaration.horizontalGap,styleDeclaration.verticalGridLineColor);
               contentPane.graphics.moveTo(_loc8_.x,0);
               contentPane.graphics.lineTo(_loc8_.x,_loc6_);
               _loc10_++;
            }
         }
         if(_loc4_ != -1)
         {
            if(_loc14_)
            {
               _loc14_.Draw(contentPane.graphics,_loc5_,this.rowHeight,true,0,this.rowHeightWithCss * _loc4_);
            }
            else if(styleDeclaration.rollOverColor <= 16777215)
            {
               contentPane.graphics.beginFill(styleDeclaration.rollOverColor,1);
               contentPane.graphics.drawRect(0,this.rowHeightWithCss * _loc4_,_loc5_,this.rowHeight);
               contentPane.graphics.endFill();
            }
            _loc10_ = 0;
            while(_loc10_ < _loc3_)
            {
               if(this.items[_loc4_][_loc10_] is ListTextField)
               {
                  styleDeclaration.SetTextFieldOverStyle(this.items[_loc4_][_loc10_] as ListTextField);
               }
               _loc10_++;
            }
         }
         var _loc16_:Array;
         if((_loc16_ = this.selectionIndices).length > 0 && _loc16_[0] != -1)
         {
            if(!_loc15_)
            {
               if(styleDeclaration.selectionColor <= 16777215)
               {
                  contentPane.graphics.beginFill(styleDeclaration.selectionColor,1);
               }
            }
            _loc9_ = 0;
            while(_loc9_ < (!!this.allowMultipleSelection ? _loc16_.length : 1))
            {
               if(_loc16_[_loc9_] != _loc4_)
               {
                  if(_loc15_)
                  {
                     _loc15_.Draw(contentPane.graphics,_loc5_,this.rowHeight,true,0,this.rowHeightWithCss * _loc16_[_loc9_]);
                  }
                  else
                  {
                     contentPane.graphics.drawRect(0,this.rowHeightWithCss * _loc16_[_loc9_],_loc5_,this.rowHeight);
                  }
                  _loc10_ = 0;
                  while(_loc10_ < _loc3_)
                  {
                     if(this.items[_loc16_[_loc9_]][_loc10_] is ListTextField)
                     {
                        styleDeclaration.SetTextFieldSelectedStyle(this.items[_loc16_[_loc9_]][_loc10_] as ListTextField);
                     }
                     _loc10_++;
                  }
               }
               _loc9_++;
            }
            contentPane.graphics.endFill();
         }
      }
      
      private function PagerChangeHandler(param1:Event) : void
      {
      }
      
      private function ItemDataChangeHandler(param1:AsguiEvent) : void
      {
         this.dispatchEvent(param1.clone());
      }
      
      private function ContentMouseMoveHandler(param1:MouseEvent) : void
      {
         if(this.overRowIndex != this.lastOverRowIndex)
         {
            this.lastOverRowIndex = this.overRowIndex;
            this.$DrawGrid();
            this.DispatchListEvent(ListEvent.OVER_ROW_CHANGED);
         }
      }
      
      private function ContentMouseOverHandler(param1:MouseEvent) : void
      {
         contentPane.addEventListener(MouseEvent.MOUSE_MOVE,this.ContentMouseMoveHandler);
      }
      
      private function ContentMouseOutHandler(param1:MouseEvent) : void
      {
         contentPane.removeEventListener(MouseEvent.MOUSE_MOVE,this.ContentMouseMoveHandler);
         this.lastOverRowIndex = -1;
         this.$DrawGrid();
      }
      
      private function ContentDownHandler(param1:MouseEvent) : void
      {
         if(this.overRowIndex != -1)
         {
            this.DispatchListEvent(ListEvent.ITEM_DOWN);
         }
      }
      
      private function ContentClickHandler(param1:MouseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:int = this.overRowIndex;
         var _loc3_:int = this.selectedIndex;
         if(this.selectable)
         {
            if(this.allowMultipleSelection)
            {
               if(param1.shiftKey)
               {
                  if(this._selectionIndices.length > 0)
                  {
                     _loc4_ = Math.min(_loc2_,this._selectionIndices[0]);
                     _loc5_ = Math.max(_loc2_,this._selectionIndices[0]);
                     this._selectionIndices = [];
                     _loc6_ = _loc4_;
                     while(_loc6_ <= _loc5_)
                     {
                        this._selectionIndices.push(_loc6_);
                        _loc6_++;
                     }
                  }
                  else
                  {
                     this._selectionIndices.push(_loc2_);
                  }
               }
               else if(param1.ctrlKey)
               {
                  _loc7_ = this._selectionIndices.length;
                  _loc6_ = 0;
                  while(_loc6_ < this._selectionIndices.length)
                  {
                     if(this._selectionIndices[_loc6_] == _loc2_)
                     {
                        this._selectionIndices.splice(_loc6_,1);
                        break;
                     }
                     if(this._selectionIndices[_loc6_] > _loc2_)
                     {
                        this._selectionIndices.splice(_loc6_,0,_loc2_);
                        break;
                     }
                     _loc6_++;
                  }
                  if(_loc6_ == _loc7_)
                  {
                     this._selectionIndices.push(_loc2_);
                  }
               }
               else if(this._selectionIndices[0] == _loc2_)
               {
                  this._selectionIndices = [];
               }
               else
               {
                  this._selectionIndices = [_loc2_];
               }
            }
            else if(_loc2_ != -1)
            {
               this._selectionIndices = [_loc2_];
            }
         }
         if(_loc2_ != -1)
         {
            this.DispatchListEvent(ListEvent.ITEM_CLICK);
         }
         if(_loc3_ != this.selectedIndex)
         {
            this.DispatchListEvent(ListEvent.SELECT_CHANGE);
         }
         this.$DrawGrid();
      }
      
      private function DispatchListEvent(param1:String) : void
      {
         var _loc2_:ListEvent = new ListEvent(param1);
         _loc2_.columnIndex = this.overColumnIndex;
         _loc2_.rowIndex = this.overRowIndex;
         _loc2_.itemRenderer = this.overItem;
         this.dispatchEvent(_loc2_);
      }
      
      private function ContentDoubleClickHandler(param1:MouseEvent) : void
      {
         if(this.overRowIndex != -1)
         {
            this.DispatchListEvent(ListEvent.ITEM_DOUBLE_CLICK);
         }
      }
      
      private function DataProviderChangeHandler(param1:DataProviderEvent) : void
      {
         this.Refresh();
      }
      
      private function DataProviderPageChangeHandler(param1:DataProviderEvent) : void
      {
         if(this.turningOption == ListTurningOption.PAGE)
         {
            this.Refresh();
         }
      }
      
      protected function InvalidateColumns() : void
      {
         this.columnsChanged = true;
         InvalidateProperties();
         InvalidateSize();
         InvalidateDisplayList();
         this.CheckColumns();
      }
      
      override public function ValidateProperties() : void
      {
         var _loc1_:ListColumn = null;
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:IListItemRenderer = null;
         var _loc5_:int = this.columnCount;
         if(invalidatePropertiesFlag && (this.dataProviderChanged || this.columnsChanged))
         {
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               _loc1_ = this.columns[_loc4_] as ListColumn;
               if(this.headItems.length < _loc5_)
               {
                  this.headItems.length = _loc5_;
               }
               if(this.headItems[_loc4_] == null && styleDeclaration.headerHeight)
               {
                  this.headItems[_loc4_] = _loc1_.headerCreatingFunction.apply(this,[_loc4_,_loc1_.headerClass]);
                  if(this.headItems[_loc4_] is TextField)
                  {
                     styleDeclaration.SetHeaderTextFieldStyle(this.headItems[_loc4_] as TextField);
                  }
                  addChild(this.headItems[_loc4_] as DisplayObject);
               }
               if(this.headItems[_loc4_] && (this.columns[_loc4_] as ListColumn).headerText)
               {
                  (this.headItems[_loc4_] as IListItemRenderer).data = SS.$((this.columns[_loc4_] as ListColumn).headerText);
               }
               _loc4_++;
            }
            while(this.headItems.length > _loc5_)
            {
               (removeChild(this.headItems.pop() as DisplayObject) as IListItemRenderer).Dispose();
            }
            if(this._dataProvider)
            {
               if(this.turningOption == ListTurningOption.PAGE)
               {
                  this._dataProvider.itemsPerPage = int(displayHeight / this.rowHeightWithCss);
               }
               else
               {
                  this._dataProvider.itemsPerPage = 255;
               }
               _loc6_ = this._dataProvider.rowCount;
               if(this.items.length < _loc6_)
               {
                  this.items.length = _loc6_;
               }
               _loc3_ = 0;
               while(_loc3_ < _loc6_)
               {
                  if(this.items[_loc3_] == null)
                  {
                     this.items[_loc3_] = new Vector.<IListItemRenderer>();
                  }
                  if(this.items[_loc3_].length < _loc5_)
                  {
                     this.items[_loc3_].length = _loc5_;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < _loc5_)
                  {
                     _loc1_ = this.columns[_loc4_] as ListColumn;
                     if(this.items[_loc3_][_loc4_] == null || _loc1_.invalidateColumnsFlag || _loc1_.hasCreatingFunction)
                     {
                        if(this.items[_loc3_][_loc4_])
                        {
                           (this.items[_loc3_][_loc4_] as IListItemRenderer).Dispose();
                           if((this.items[_loc3_][_loc4_] as DisplayObject).parent == this.contentPane)
                           {
                              this.contentPane.removeChild(this.items[_loc3_][_loc4_] as DisplayObject);
                           }
                        }
                        this.items[_loc3_][_loc4_] = _loc1_.itemRendererCreatingFunction.apply(this,[this.startIndexByPage + _loc3_,_loc4_,_loc1_.itemRendererClass]);
                        if(_loc1_.itemRendererCreatedFunction != null)
                        {
                           (_loc1_.itemRendererCreatedFunction as Function)(this.items[_loc3_][_loc4_] as IListItemRenderer,this.startIndexByPage + _loc3_,_loc4_);
                        }
                     }
                     if(((_loc7_ = this.items[_loc3_][_loc4_] as IListItemRenderer) as DisplayObject).parent != this.contentPane)
                     {
                        this.contentPane.addChild(_loc7_ as DisplayObject);
                     }
                     if(_loc1_.dataEditable != _loc7_.dataEditable)
                     {
                        _loc7_.dataEditable = _loc1_.dataEditable;
                        if((this.items[_loc3_][_loc4_] as IListItemRenderer).dataEditable)
                        {
                           _loc7_.removeEventListener(AsguiEvent.DATA_CHANGE,this.ItemDataChangeHandler);
                           _loc7_.addEventListener(AsguiEvent.DATA_CHANGE,this.ItemDataChangeHandler);
                        }
                     }
                     _loc2_ = this._dataProvider.GetData(_loc3_);
                     _loc7_.dataField = _loc1_.dataField;
                     _loc7_.data = _loc2_;
                     if(_loc7_ is ListTextField)
                     {
                        (_loc7_ as ListTextField).SetStyle(styleDeclaration);
                     }
                     if(_loc1_.itemRendererDataChangeFunction != null)
                     {
                        (_loc1_.itemRendererDataChangeFunction as Function)(_loc7_,this.startIndexByPage + _loc3_,_loc4_);
                     }
                     _loc1_.invalidateColumnsFlag = false;
                     _loc4_++;
                  }
                  _loc3_++;
               }
               _loc3_ = _loc6_;
               while(_loc3_ < this.items.length)
               {
                  _loc4_ = 0;
                  while(_loc4_ < _loc5_)
                  {
                     if(this.items.length > _loc3_ && this.items[_loc3_].length > _loc4_ && this.items[_loc3_][_loc4_] && (this.items[_loc3_][_loc4_] as DisplayObject).parent == this.contentPane)
                     {
                        this.contentPane.removeChild(this.items[_loc3_][_loc4_] as DisplayObject);
                     }
                     _loc4_++;
                  }
                  _loc3_++;
               }
               _loc3_ = 0;
               while(_loc3_ < this.items.length)
               {
                  _loc4_ = _loc5_;
                  while(_loc4_ < this.items[_loc3_].length)
                  {
                     if(this.items.length > _loc3_ && this.items[_loc3_].length > _loc4_ && this.items[_loc3_][_loc4_] && (this.items[_loc3_][_loc4_] as DisplayObject).parent == this.contentPane)
                     {
                        this.contentPane.removeChild(this.items[_loc3_][_loc4_] as DisplayObject);
                     }
                     _loc4_++;
                  }
                  _loc3_++;
               }
            }
            this.dataProviderChanged = false;
            this.columnsChanged = false;
         }
         super.ValidateProperties();
      }
      
      override public function ValidateSize() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:IListItemRenderer = null;
         var _loc5_:int = 0;
         if(invalidateSizeFlag)
         {
            _loc1_ = this.columnCount;
            _loc3_ = 0;
            while(_loc3_ < _loc1_)
            {
               if(this.headItems.length > _loc3_ && this.headItems[_loc3_])
               {
                  (this.columns[_loc3_] as ListColumn).SetX(this.headItems[_loc3_] as DisplayObject);
                  (this.headItems[_loc3_] as DisplayObject).x += styleDeclaration.paddingLeft;
                  (this.columns[_loc3_] as ListColumn).SetWidth(this.headItems[_loc3_] as DisplayObject);
                  (this.headItems[_loc3_] as DisplayObject).height = styleDeclaration.headerHeight;
                  (this.headItems[_loc3_] as DisplayObject).y = (styleDeclaration.headerHeight - (this.headItems[_loc3_] as DisplayObject).height) / 2 + styleDeclaration.headerPaddingTop;
               }
               _loc3_++;
            }
            if(this._dataProvider)
            {
               _loc5_ = this._dataProvider.rowCount;
               _loc2_ = 0;
               while(_loc2_ < _loc5_)
               {
                  _loc3_ = 0;
                  while(_loc3_ < _loc1_)
                  {
                     _loc4_ = this.items[_loc2_][_loc3_];
                     (this.columns[_loc3_] as ListColumn).SetX(_loc4_ as DisplayObject);
                     (this.columns[_loc3_] as ListColumn).SetWidth(_loc4_ as DisplayObject);
                     (this.items[_loc2_][_loc3_] as IListItemRenderer).y = _loc2_ * this.rowHeightWithCss + styleDeclaration.textPaddingTop;
                     _loc3_++;
                  }
                  _loc2_++;
               }
               if(this.pager)
               {
                  this.pager.totalPage = this._dataProvider.totalPage;
               }
            }
            this.$DrawGrid();
         }
         super.ValidateSize();
      }
      
      override public function ValidateDisplayList() : void
      {
         var _loc1_:ScrollBar = null;
         if(invalidateDisplayListFlag)
         {
            scrollHandler.SetScrollSize(0,0,displayWidth,displayHeight);
            scrollHandler.UpdateContentHolderChildrenSize();
            if(this.turningOption == ListTurningOption.SCROLL)
            {
               if(scrollHandler.hasVerticalScrollBar)
               {
                  _loc1_ = scrollHandler.GetVerticalScrollBar();
                  if(!scrollHandler.hasVerticalScrollBarAdded)
                  {
                     addChild(_loc1_);
                  }
                  _loc1_.x = contentPane.x + displayWidth - _loc1_.width + scrollHandler.verticalPageScrollOffsetX;
                  _loc1_.y = contentPane.y + scrollHandler.verticalPageScrollOffsetY;
               }
               else
               {
                  scrollHandler.RemoveVerticalScrollBar();
               }
               if(scrollHandler.hasHorizontalScrollBar)
               {
                  _loc1_ = scrollHandler.GetHorizontalScrollBar();
                  if(!scrollHandler.hasHorizontalScrollBarAdded)
                  {
                     addChild(_loc1_);
                  }
                  _loc1_.x = contentPane.x;
                  _loc1_.y = contentPane.y + displayHeight - _loc1_.height;
               }
               else
               {
                  scrollHandler.RemoveHorizontalScrollBar();
               }
            }
            else if(this.turningOption == ListTurningOption.PAGE)
            {
               if(this.pager == null)
               {
                  this.pager = new this.pagerClass() as IPager;
                  this.pager.addEventListener(Event.CHANGE,this.PagerChangeHandler);
                  addChild(this.pager as DisplayObject);
                  this.pager.y = this.height - this.pager.height;
               }
               this.pager.dataProvider = this._dataProvider;
            }
         }
         super.ValidateDisplayList();
      }
      
      override public function ValidateSkin() : void
      {
         if(invalidateSkinFlag)
         {
            if(this.$headerBackgroundSkin == null)
            {
               this.$headerBackgroundSkin = StyleManager.GetStyleSkin(styleDeclaration.headerBackgroundSkin);
            }
            if(this.$footerBackgroundSkin == null)
            {
               this.$footerBackgroundSkin = StyleManager.GetStyleSkin(styleDeclaration.footerBackgroundSkin);
            }
            if(this.$headerCellSkin == null)
            {
               this.$headerCellSkin = StyleManager.GetStyleSkin(styleDeclaration.headerCellSkin);
            }
            if(this.$cellSkin == null)
            {
               this.$cellSkin = StyleManager.GetStyleSkin(styleDeclaration.cellSkin);
            }
         }
         super.ValidateSkin();
      }
      
      override protected function $Render() : void
      {
         super.$Render();
         this.$DrawHead();
         this.$DrawFoot();
      }
      
      protected function $DrawHead() : void
      {
         var _loc2_:int = 0;
         var _loc3_:ListColumn = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:int = styleDeclaration.headerHeight;
         if(_loc1_ > 0)
         {
            if(this.$headerBackgroundSkin != null)
            {
               this.$headerBackgroundSkin.Draw(this.graphics,this.width,_loc1_,true);
            }
            _loc2_ = 0;
            while(_loc2_ < this.columnCount)
            {
               _loc3_ = this.columns[_loc2_] as ListColumn;
               _loc4_ = _loc3_.columnWidth;
               if((_loc5_ = styleDeclaration.paddingLeft + _loc3_.x) >= displayWidth)
               {
                  break;
               }
               if(_loc5_ + _loc4_ > displayWidth || _loc2_ == this.columnCount - 1)
               {
                  _loc4_ = displayWidth - _loc5_;
               }
               if(this.$headerCellSkin)
               {
                  this.$headerCellSkin.Draw(this.graphics,_loc4_,_loc1_,true,_loc5_);
               }
               else if(styleDeclaration.headerLines)
               {
                  if(_loc2_ != 0)
                  {
                     this.graphics.lineStyle(styleDeclaration.headerGap,styleDeclaration.headerLineColor);
                     this.graphics.moveTo(_loc5_,styleDeclaration.headerPaddingTop);
                     this.graphics.lineTo(_loc5_,_loc1_);
                  }
               }
               _loc2_++;
            }
         }
      }
      
      protected function $DrawFoot() : void
      {
         var _loc1_:int = styleDeclaration.footerHeight;
         if(_loc1_ > 0)
         {
            if(this.$footerBackgroundSkin != null)
            {
               this.$footerBackgroundSkin.Draw(this.graphics,this.width,_loc1_,true,0,this.height - _loc1_);
            }
         }
      }
   }
}

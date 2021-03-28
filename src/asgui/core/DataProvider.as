package asgui.core
{
   import asgui.events.DataProviderEvent;
   import flash.events.EventDispatcher;
   
   public class DataProvider extends EventDispatcher
   {
       
      
      private var array:Array;
      
      private var autoDispatchPageChange:Boolean;
      
      private var _data:Object;
      
      private var _currentPage:int = 1;
      
      private var _itemsPerPage:int = 255;
      
      public function DataProvider(param1:Object = null, param2:Boolean = true)
      {
         this.array = [];
         super();
         this.data = param1;
         this.autoDispatchPageChange = param2;
      }
      
      public function get data() : Object
      {
         if(!this._data)
         {
            return [];
         }
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         var _loc2_:int = 0;
         if(this._data != param1)
         {
            this._data = param1;
            if(this._data is Array)
            {
               this.array = this._data as Array;
            }
            else
            {
               this.array = [];
               _loc2_ = 0;
               while(_loc2_ < this._data.length)
               {
                  this.array.push(this._data[_loc2_]);
                  _loc2_++;
               }
            }
            this.dispatchEvent(new DataProviderEvent(DataProviderEvent.DATA_CHANGE));
         }
      }
      
      public function get rowCount() : int
      {
         var _loc1_:int = this.array.length;
         _loc1_ -= (this.currentPage - 1) * this.itemsPerPage;
         return Math.min(_loc1_,this.itemsPerPage);
      }
      
      public function set currentPage(param1:int) : void
      {
         if(this._currentPage == param1 || param1 < 1 || param1 > this.totalPage)
         {
            return;
         }
         this._currentPage = param1;
         if(this.autoDispatchPageChange)
         {
            this.dispatchEvent(new DataProviderEvent(DataProviderEvent.CURRENT_PAGE_CHANGE));
         }
      }
      
      public function get currentPage() : int
      {
         return this._currentPage;
      }
      
      public function set itemsPerPage(param1:int) : void
      {
         if(this._itemsPerPage == param1 || param1 < 1)
         {
            return;
         }
         this._itemsPerPage = param1;
      }
      
      public function get itemsPerPage() : int
      {
         return this._itemsPerPage;
      }
      
      public function get totalItem() : int
      {
         return this.array.length;
      }
      
      public function set totalItem(param1:int) : void
      {
         var _loc2_:int = 0;
         if(this.array.length < param1)
         {
            _loc2_ = this.array.length;
            while(_loc2_ < param1)
            {
               this.array[_loc2_] = {};
               _loc2_++;
            }
         }
         else if(this.array.length > param1)
         {
            while(this.array.length > param1)
            {
               this.array.pop();
            }
         }
      }
      
      public function get totalPage() : int
      {
         return Math.ceil(this.array.length / this.itemsPerPage);
      }
      
      public function SetData(param1:Array, param2:int = 0, param3:Boolean = true) : void
      {
         var _loc4_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            this.array[_loc4_ + param2] = param1[_loc4_];
            _loc4_++;
         }
         this.dispatchEvent(new DataProviderEvent(DataProviderEvent.DATA_CHANGE));
      }
      
      public function GetData(param1:int, param2:int = 0) : Object
      {
         param1 = (this.currentPage - 1) * this.itemsPerPage + param1;
         if(this.array[param1] is Array)
         {
            return this.array[param1][param2];
         }
         return this.array[param1];
      }
      
      public function GetDataHasValue(param1:String, param2:Object) : Object
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < this.rowCount)
         {
            if(this.array[_loc3_][param1] == param2)
            {
               return this.array[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function GetRowIndexByData(param1:Object) : int
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.rowCount)
         {
            if(this.array[_loc2_] == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function GetRow(param1:int) : Object
      {
         param1 = (this.currentPage - 1) * this.itemsPerPage + param1;
         return this.array[param1];
      }
   }
}

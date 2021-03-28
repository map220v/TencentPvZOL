package com.qq.modules.basic.view.components
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class QPagerSmall extends QPagerSmallCE
   {
       
      
      private var _currentPage:int = 1;
      
      private var _totalPage:int = 1;
      
      public function QPagerSmall()
      {
         super();
         txtPager.SetStyle("color","#fff661");
         this.btnNext.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.btnPrev.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.update();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         btnNext.coolDownTime = 200;
         btnPrev.coolDownTime = 200;
      }
      
      public function get currentPage() : int
      {
         return this._currentPage;
      }
      
      public function set currentPage(param1:int) : void
      {
         if(this._currentPage != param1 && param1 >= 1 && param1 <= this.totalPage)
         {
            this._currentPage = param1;
            this.dispatchEvent(new Event(Event.CHANGE));
            this.update();
         }
      }
      
      public function get totalPage() : int
      {
         return this._totalPage;
      }
      
      public function set totalPage(param1:int) : void
      {
         if(this._totalPage != param1 && param1 >= 1)
         {
            this._totalPage = param1;
            if(this._totalPage < this.currentPage)
            {
               this.currentPage = this._totalPage;
            }
            this.update();
         }
      }
      
      override public function Dispose() : void
      {
         if(!hasDisposed)
         {
            this.btnNext.removeEventListener(MouseEvent.CLICK,this.clickHandler);
            this.btnPrev.removeEventListener(MouseEvent.CLICK,this.clickHandler);
            super.Dispose();
         }
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.btnNext:
               ++this.currentPage;
               break;
            case this.btnPrev:
               --this.currentPage;
         }
      }
      
      private function update() : void
      {
         txtPager.text = this.currentPage + " / " + this.totalPage;
         btnPrev.enabled = this.currentPage > 1;
         btnNext.enabled = this.currentPage < this.totalPage;
      }
   }
}

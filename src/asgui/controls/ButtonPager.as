package asgui.controls
{
   import asgui.containers.Canvas;
   import asgui.core.DataProvider;
   import asgui.core.IPager;
   import asgui.core.ScrollPolicy;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ButtonPager extends Canvas implements IPager
   {
      
      public static const STYLE:String = "ButtonPager";
       
      
      protected var prevBtn:Button;
      
      protected var nextBtn:Button;
      
      protected var txt:Label;
      
      private var _dataProvider:DataProvider;
      
      private var _currentPage:int = 1;
      
      private var _totalPage:int = 1;
      
      public function ButtonPager()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.verticalScrollPolicy = ScrollPolicy.OFF;
         this.prevBtn = new Button();
         this.prevBtn.left = 0;
         this.prevBtn.styleName = styleDeclaration.prevButtonStyleName;
         this.prevBtn.addEventListener(MouseEvent.CLICK,this.ClickHandler);
         this.addChild(this.prevBtn);
         this.txt = new Label();
         this.txt.SetStyle("textAlign","center");
         this.txt.hcenter = 0;
         this.txt.width = 50;
         this.txt.vcenter = 0;
         this.addChild(this.txt);
         this.nextBtn = new Button();
         this.nextBtn.right = 0;
         this.nextBtn.styleName = styleDeclaration.nextButtonStyleName;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.ClickHandler);
         this.addChild(this.nextBtn);
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      override public function Dispose() : void
      {
         if(this.prevBtn)
         {
            this.prevBtn.removeEventListener(MouseEvent.CLICK,this.ClickHandler);
            this.prevBtn = null;
         }
         if(this.nextBtn)
         {
            this.nextBtn.removeEventListener(MouseEvent.CLICK,this.ClickHandler);
            this.nextBtn = null;
         }
         if(this._dataProvider)
         {
            this._dataProvider.removeEventListener(Event.CHANGE,this.DataProviderChangeHandler);
            this._dataProvider = null;
         }
         super.Dispose();
      }
      
      public function set dataProvider(param1:DataProvider) : void
      {
         if(this._dataProvider == param1)
         {
            return;
         }
         if(this._dataProvider)
         {
            this._dataProvider.removeEventListener(Event.CHANGE,this.DataProviderChangeHandler);
         }
         this._dataProvider = param1;
         this._dataProvider.addEventListener(Event.CHANGE,this.DataProviderChangeHandler);
      }
      
      public function get dataProvider() : DataProvider
      {
         return this._dataProvider;
      }
      
      public function set currentPage(param1:int) : void
      {
         if(this._currentPage == param1 || param1 < 1 || param1 > this.totalPage)
         {
            return;
         }
         this._currentPage = param1;
         InvalidateProperties();
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get currentPage() : int
      {
         return this._currentPage;
      }
      
      public function set totalPage(param1:int) : void
      {
         if(this._totalPage == param1)
         {
            return;
         }
         if(param1 < 1)
         {
            param1 = this._totalPage = param1;
         }
         if(this.currentPage > this.totalPage)
         {
            this.currentPage = this.totalPage;
         }
         InvalidateProperties();
      }
      
      public function get totalPage() : int
      {
         return this._totalPage;
      }
      
      override public function ValidateProperties() : void
      {
         if(invalidatePropertiesFlag)
         {
            if(this.dataProvider)
            {
               this.totalPage = this.dataProvider.totalPage;
            }
            if(this.prevBtn)
            {
               this.prevBtn.enabled = this.currentPage > 1;
            }
            if(this.nextBtn)
            {
               this.nextBtn.enabled = this.currentPage < this.totalPage;
            }
            this.txt.text = this.currentPage + " / " + this.totalPage;
            if(this.dataProvider)
            {
               this.dataProvider.currentPage = this.currentPage;
            }
         }
         super.ValidateProperties();
      }
      
      override public function ValidateSize() : void
      {
         super.ValidateSize();
      }
      
      private function ClickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.prevBtn:
               --this.currentPage;
               break;
            case this.nextBtn:
               ++this.currentPage;
         }
      }
      
      private function DataProviderChangeHandler(param1:Event) : void
      {
         InvalidateProperties();
      }
   }
}

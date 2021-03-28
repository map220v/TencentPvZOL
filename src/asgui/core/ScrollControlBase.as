package asgui.core
{
   import asgui.controls.scrolls.ScrollHandler;
   import asgui.events.ScrollEvent;
   import flash.display.Sprite;
   
   public class ScrollControlBase extends UIComponent
   {
       
      
      public var scrollHandler:ScrollHandler;
      
      protected var contentPane:Sprite;
      
      private var scrollPropertiesChanged:Boolean = false;
      
      private var scrollPositionChanged:Boolean = true;
      
      public function ScrollControlBase()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.contentPane = new Sprite();
         this.contentPane.name = "contentPane";
         this.addChild(this.contentPane);
         this.scrollHandler = new ScrollHandler(this.contentPane);
         this.scrollHandler.SetScrollStyleNames(this.styleDeclaration.verticalScrollBarStyleName,this.styleDeclaration.horizontalScrollBarStyleName);
         this.scrollHandler.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.scrollHandler.horizontalScrollPolicy = ScrollPolicy.AUTO;
         this.scrollHandler.addEventListener(ScrollEvent.SCROLL_UPDATE,this.scrollUpdateHandler);
         this.scrollHandler.addEventListener(ScrollEvent.SCROLL_BAR_DOWN,this.scrollUpdateHandler);
         this.scrollHandler.addEventListener(ScrollEvent.SCROLL_BAR_UP,this.scrollUpdateHandler);
      }
      
      override protected function $StyleChanged() : void
      {
         super.$StyleChanged();
         if(this.hasDisposed)
         {
            return;
         }
         if(this.scrollHandler)
         {
            this.scrollHandler.SetScrollStyleNames(this.styleDeclaration.verticalScrollBarStyleName,this.styleDeclaration.horizontalScrollBarStyleName);
         }
      }
      
      override public function Dispose() : void
      {
         if(this.scrollHandler)
         {
            this.scrollHandler.removeEventListener(ScrollEvent.SCROLL_UPDATE,this.scrollUpdateHandler);
            this.scrollHandler.removeEventListener(ScrollEvent.SCROLL_BAR_DOWN,this.scrollUpdateHandler);
            this.scrollHandler.removeEventListener(ScrollEvent.SCROLL_BAR_UP,this.scrollUpdateHandler);
            this.scrollHandler.Dispose();
            this.scrollHandler = null;
         }
         super.Dispose();
      }
      
      public function get verticalScrollPosition() : Number
      {
         if(this.scrollHandler == null)
         {
            return 0;
         }
         return this.scrollHandler.verticalScrollPosition;
      }
      
      public function set verticalScrollPosition(param1:Number) : void
      {
         if(this.scrollHandler == null)
         {
            return;
         }
         this.scrollHandler.verticalScrollPosition = param1;
      }
      
      public function get verticalScrollPolicy() : String
      {
         return this.scrollHandler.verticalScrollPolicy;
      }
      
      public function set verticalScrollPolicy(param1:String) : void
      {
         if(this.scrollHandler.verticalScrollPolicy != param1)
         {
            this.scrollHandler.verticalScrollPolicy = param1;
            InvalidateSize();
         }
      }
      
      public function get horizontalScrollPosition() : Number
      {
         return this.scrollHandler.horizontalScrollPosition;
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         this.scrollHandler.horizontalScrollPosition = param1;
      }
      
      public function get horizontalScrollPolicy() : String
      {
         return this.scrollHandler.horizontalScrollPolicy;
      }
      
      public function set horizontalScrollPolicy(param1:String) : void
      {
         if(this.scrollHandler.horizontalScrollPolicy != param1)
         {
            this.scrollHandler.horizontalScrollPolicy = param1;
            InvalidateSize();
         }
      }
      
      public function get maxHorizontalScrollPosition() : Number
      {
         ValidateDisplayList();
         return this.scrollHandler.maxHorizontalScrollPosition;
      }
      
      public function get maxVerticalScrollPosition() : Number
      {
         ValidateDisplayList();
         return this.scrollHandler.maxVerticalScrollPosition;
      }
      
      public function get minHorizontalScrollPosition() : Number
      {
         ValidateDisplayList();
         return this.scrollHandler.minHorizontalScrollPosition;
      }
      
      public function get minVerticalScrollPosition() : Number
      {
         ValidateDisplayList();
         return this.scrollHandler.minVerticalScrollPosition;
      }
      
      override public function ValidateSize() : void
      {
         if(invalidateSizeFlag)
         {
            this.scrollHandler.UpdatePosition();
         }
         super.ValidateSize();
      }
      
      private function scrollUpdateHandler(param1:ScrollEvent) : void
      {
         this.dispatchEvent(param1);
      }
   }
}

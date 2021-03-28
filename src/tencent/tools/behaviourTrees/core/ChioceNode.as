package tencent.tools.behaviourTrees.core
{
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ChioceNode extends BaseNode
   {
       
      
      public function ChioceNode()
      {
         super();
         this.nodeType = BehaviourTreeNodeType.CHIOCE;
      }
      
      override public function calculate() : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc1_:int = 0;
         while(_loc1_ < this.childNodeNum)
         {
            _loc2_ = this.childNodes[_loc1_].calculate();
            if(_loc2_ == true)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
   }
}

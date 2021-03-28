package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_AllServerRankArena_GetOpponent_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_AllServerRankArena_GetOpponent_SC";
      
      public static const SELF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_AllServerRankArena_GetOpponent_SC.self","self",1 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerRankArena_Opponent);
      
      public static const OPPONENT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_AllServerRankArena_GetOpponent_SC.opponent","opponent",2 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerRankArena_Opponent);
       
      
      private var self$field:Dto_AllServerRankArena_Opponent;
      
      public var opponent:Array;
      
      public function Cmd_AllServerRankArena_GetOpponent_SC()
      {
         this.opponent = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_AllServerRankArena_GetOpponent_SC.$MessageID;
      }
      
      public function clearSelf() : void
      {
         this.self$field = null;
      }
      
      public function get hasSelf() : Boolean
      {
         return this.self$field != null;
      }
      
      public function set self(param1:Dto_AllServerRankArena_Opponent) : void
      {
         this.self$field = param1;
      }
      
      public function get self() : Dto_AllServerRankArena_Opponent
      {
         return this.self$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasSelf)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.self$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.opponent.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.opponent[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_GetOpponent_SC.self cannot be set twice.");
                  }
                  _loc3_++;
                  this.self = new Dto_AllServerRankArena_Opponent();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.self);
                  break;
               case 2:
                  this.opponent.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_AllServerRankArena_Opponent()));
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}

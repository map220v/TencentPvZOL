package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FightRound extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FightRound";
      
      public static const ROUND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightRound.round","round",1 << 3 | WireType.VARINT);
      
      public static const ACTION:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightRound.action","action",2 << 3 | WireType.LENGTH_DELIMITED,Dto_FightAction);
      
      public static const BUFFEFFECT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightRound.buffEffect","buffEffect",3 << 3 | WireType.LENGTH_DELIMITED,Dto_FightDamage);
       
      
      private var round$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var action:Array;
      
      public var buffEffect:Array;
      
      public function Dto_FightRound()
      {
         this.action = [];
         this.buffEffect = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FightRound.$MessageID;
      }
      
      public function clearRound() : void
      {
         this.hasField$0 &= 4294967294;
         this.round$field = new uint();
      }
      
      public function get hasRound() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set round(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.round$field = param1;
      }
      
      public function get round() : uint
      {
         return this.round$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasRound)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.round$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.action.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.action[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.buffEffect.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buffEffect[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                     throw new IOError("Bad data format: Dto_FightRound.round cannot be set twice.");
                  }
                  _loc3_++;
                  this.round = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.action.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FightAction()));
                  break;
               case 3:
                  this.buffEffect.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FightDamage()));
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}

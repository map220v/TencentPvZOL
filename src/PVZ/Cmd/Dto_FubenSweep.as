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
   
   public final class Dto_FubenSweep extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FubenSweep";
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FubenSweep.reward","reward",1 << 3 | WireType.LENGTH_DELIMITED,Dto_FightReward);
      
      public static const CARDEXP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FubenSweep.cardExp","cardExp",2 << 3 | WireType.LENGTH_DELIMITED,Dto_CardExp);
       
      
      public var reward:Array;
      
      private var cardExp$field:Dto_CardExp;
      
      public function Dto_FubenSweep()
      {
         this.reward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FubenSweep.$MessageID;
      }
      
      public function clearCardExp() : void
      {
         this.cardExp$field = null;
      }
      
      public function get hasCardExp() : Boolean
      {
         return this.cardExp$field != null;
      }
      
      public function set cardExp(param1:Dto_CardExp) : void
      {
         this.cardExp$field = param1;
      }
      
      public function get cardExp() : Dto_CardExp
      {
         return this.cardExp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc2_]);
            _loc2_++;
         }
         if(this.hasCardExp)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardExp$field);
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
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FightReward()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FubenSweep.cardExp cannot be set twice.");
                  }
                  _loc3_++;
                  this.cardExp = new Dto_CardExp();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.cardExp);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}

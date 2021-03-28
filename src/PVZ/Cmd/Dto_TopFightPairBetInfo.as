package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_TopFightPairBetInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_TopFightPairBetInfo";
      
      public static const PAIRINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TopFightPairBetInfo.pairIndex","pairIndex",1 << 3 | WireType.VARINT);
      
      public static const BETTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TopFightPairBetInfo.betType","betType",2 << 3 | WireType.VARINT);
       
      
      private var pairIndex$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var betType$field:uint;
      
      public function Dto_TopFightPairBetInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_TopFightPairBetInfo.$MessageID;
      }
      
      public function clearPairIndex() : void
      {
         this.hasField$0 &= 4294967294;
         this.pairIndex$field = new uint();
      }
      
      public function get hasPairIndex() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set pairIndex(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.pairIndex$field = param1;
      }
      
      public function get pairIndex() : uint
      {
         return this.pairIndex$field;
      }
      
      public function clearBetType() : void
      {
         this.hasField$0 &= 4294967293;
         this.betType$field = new uint();
      }
      
      public function get hasBetType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set betType(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.betType$field = param1;
      }
      
      public function get betType() : uint
      {
         return this.betType$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPairIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.pairIndex$field);
         }
         if(this.hasBetType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.betType$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightPairBetInfo.pairIndex cannot be set twice.");
                  }
                  _loc3_++;
                  this.pairIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightPairBetInfo.betType cannot be set twice.");
                  }
                  _loc4_++;
                  this.betType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}

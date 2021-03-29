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
   
   public final class Dto_ExpeditionFightSideBuffInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ExpeditionFightSideBuffInfo";
      
      public static const SIDEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightSideBuffInfo.sideId","sideId",1 << 3 | WireType.VARINT);
      
      public static const BUFF:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_ExpeditionFightSideBuffInfo.buff","buff",2 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightBuffInfo);
       
      
      private var sideId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var buff:Array;
      
      public function Dto_ExpeditionFightSideBuffInfo()
      {
         this.buff = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ExpeditionFightSideBuffInfo.$MessageID;
      }
      
      public function clearSideId() : void
      {
         this.hasField$0 &= 4294967294;
         this.sideId$field = new uint();
      }
      
      public function get hasSideId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set sideId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.sideId$field = param1;
      }
      
      public function get sideId() : uint
      {
         return this.sideId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasSideId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.sideId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.buff.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buff[_loc2_]);
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
                     throw new IOError("Bad data format: Dto_ExpeditionFightSideBuffInfo.sideId cannot be set twice.");
                  }
                  _loc3_++;
                  this.sideId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.buff.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightBuffInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
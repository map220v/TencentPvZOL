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
   
   public final class Dto_CardExp extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_CardExp";
      
      public static const OLDCARDEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardExp.oldCardExp","oldCardExp",1 << 3 | WireType.VARINT);
      
      public static const OLDEXPBEANNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardExp.oldExpBeanNum","oldExpBeanNum",2 << 3 | WireType.VARINT);
      
      public static const EXPOVERFLOW:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardExp.expOverflow","expOverflow",3 << 3 | WireType.VARINT);
       
      
      private var oldCardExp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var oldExpBeanNum$field:uint;
      
      private var expOverflow$field:uint;
      
      public function Dto_CardExp()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardExp.$MessageID;
      }
      
      public function clearOldCardExp() : void
      {
         this.hasField$0 &= 4294967294;
         this.oldCardExp$field = new uint();
      }
      
      public function get hasOldCardExp() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set oldCardExp(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.oldCardExp$field = param1;
      }
      
      public function get oldCardExp() : uint
      {
         return this.oldCardExp$field;
      }
      
      public function clearOldExpBeanNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.oldExpBeanNum$field = new uint();
      }
      
      public function get hasOldExpBeanNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set oldExpBeanNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.oldExpBeanNum$field = param1;
      }
      
      public function get oldExpBeanNum() : uint
      {
         return this.oldExpBeanNum$field;
      }
      
      public function clearExpOverflow() : void
      {
         this.hasField$0 &= 4294967291;
         this.expOverflow$field = new uint();
      }
      
      public function get hasExpOverflow() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set expOverflow(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.expOverflow$field = param1;
      }
      
      public function get expOverflow() : uint
      {
         return this.expOverflow$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasOldCardExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.oldCardExp$field);
         }
         if(this.hasOldExpBeanNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.oldExpBeanNum$field);
         }
         if(this.hasExpOverflow)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.expOverflow$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardExp.oldCardExp cannot be set twice.");
                  }
                  _loc3_++;
                  this.oldCardExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardExp.oldExpBeanNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.oldExpBeanNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardExp.expOverflow cannot be set twice.");
                  }
                  _loc5_++;
                  this.expOverflow = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}

package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_CardAttribute extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_CardAttribute";
      
      public static const BASEVALUE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_CardAttribute.baseValue","baseValue",1 << 3 | WireType.LENGTH_DELIMITED,Dto_CardAttributeTerm);
      
      public static const PERCENT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_CardAttribute.percent","percent",2 << 3 | WireType.LENGTH_DELIMITED,Dto_CardAttributeTerm);
       
      
      private var baseValue$field:Dto_CardAttributeTerm;
      
      private var percent$field:Dto_CardAttributeTerm;
      
      public function Dto_CardAttribute()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardAttribute.$MessageID;
      }
      
      public function clearBaseValue() : void
      {
         this.baseValue$field = null;
      }
      
      public function get hasBaseValue() : Boolean
      {
         return this.baseValue$field != null;
      }
      
      public function set baseValue(param1:Dto_CardAttributeTerm) : void
      {
         this.baseValue$field = param1;
      }
      
      public function get baseValue() : Dto_CardAttributeTerm
      {
         return this.baseValue$field;
      }
      
      public function clearPercent() : void
      {
         this.percent$field = null;
      }
      
      public function get hasPercent() : Boolean
      {
         return this.percent$field != null;
      }
      
      public function set percent(param1:Dto_CardAttributeTerm) : void
      {
         this.percent$field = param1;
      }
      
      public function get percent() : Dto_CardAttributeTerm
      {
         return this.percent$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBaseValue)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.baseValue$field);
         }
         if(this.hasPercent)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.percent$field);
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
                     throw new IOError("Bad data format: Dto_CardAttribute.baseValue cannot be set twice.");
                  }
                  _loc3_++;
                  this.baseValue = new Dto_CardAttributeTerm();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseValue);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttribute.percent cannot be set twice.");
                  }
                  _loc4_++;
                  this.percent = new Dto_CardAttributeTerm();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.percent);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}

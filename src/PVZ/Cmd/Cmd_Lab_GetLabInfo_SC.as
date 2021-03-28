package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Lab_GetLabInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Lab_GetLabInfo_SC";
      
      public static const ALLLAB:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Lab_GetLabInfo_SC.allLab","allLab",1 << 3 | WireType.LENGTH_DELIMITED,Dto_LabItem);
      
      public static const HASNEWLAB:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Lab_GetLabInfo_SC.hasNewLab","hasNewLab",2 << 3 | WireType.VARINT);
       
      
      public var allLab:Array;
      
      private var hasNewLab$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Lab_GetLabInfo_SC()
      {
         this.allLab = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Lab_GetLabInfo_SC.$MessageID;
      }
      
      public function clearHasNewLab() : void
      {
         this.hasField$0 &= 4294967294;
         this.hasNewLab$field = new Boolean();
      }
      
      public function get hasHasNewLab() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set hasNewLab(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.hasNewLab$field = param1;
      }
      
      public function get hasNewLab() : Boolean
      {
         return this.hasNewLab$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.allLab.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.allLab[_loc2_]);
            _loc2_++;
         }
         if(this.hasHasNewLab)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.hasNewLab$field);
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
                  this.allLab.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_LabItem()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Lab_GetLabInfo_SC.hasNewLab cannot be set twice.");
                  }
                  _loc3_++;
                  this.hasNewLab = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}

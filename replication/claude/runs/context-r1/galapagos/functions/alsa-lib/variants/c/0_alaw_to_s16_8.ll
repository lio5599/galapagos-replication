; ModuleID = '/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/0_alaw_to_s16_8.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/0_alaw_to_s16_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @alaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @alaw_to_s16(i8 noundef zeroext %a_val) #0 {
entry:
  %retval = alloca i32, align 4
  %a_val.addr = alloca i8, align 1
  %x = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %and = and i32 %1, 127
  store i32 %and, ptr %t, align 4
  %2 = load i32, ptr %x, align 4
  %and1 = and i32 %2, 128
  %tobool = icmp ne i32 %and1, 0
  br i1 %tobool, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %3 = load i32, ptr %t, align 4
  %cmp = icmp slt i32 %3, 16
  br i1 %cmp, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %4 = load i32, ptr %t, align 4
  %shl = shl i32 %4, 4
  %add = add nsw i32 %shl, 8
  store i32 %add, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %5 = load i32, ptr %t, align 4
  %and4 = and i32 %5, 15
  %shl5 = shl i32 %and4, 4
  %add6 = add nsw i32 %shl5, 264
  %6 = load i32, ptr %t, align 4
  %shr = ashr i32 %6, 4
  %and7 = and i32 %shr, 7
  %sub = sub nsw i32 %and7, 1
  %shl8 = shl i32 %add6, %sub
  store i32 %shl8, ptr %retval, align 4
  br label %return

if.end9:                                          ; preds = %entry
  %7 = load i32, ptr %t, align 4
  %cmp10 = icmp slt i32 %7, 16
  br i1 %cmp10, label %if.then12, label %if.end16

if.then12:                                        ; preds = %if.end9
  %8 = load i32, ptr %t, align 4
  %shl13 = shl i32 %8, 4
  %add14 = add nsw i32 %shl13, 8
  %sub15 = sub nsw i32 0, %add14
  store i32 %sub15, ptr %retval, align 4
  br label %return

if.end16:                                         ; preds = %if.end9
  %9 = load i32, ptr %t, align 4
  %and17 = and i32 %9, 15
  %shl18 = shl i32 %and17, 4
  %add19 = add nsw i32 %shl18, 264
  %10 = load i32, ptr %t, align 4
  %shr20 = ashr i32 %10, 4
  %and21 = and i32 %shr20, 7
  %sub22 = sub nsw i32 %and21, 1
  %shl23 = shl i32 %add19, %sub22
  %sub24 = sub nsw i32 0, %shl23
  store i32 %sub24, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end16, %if.then12, %if.end, %if.then3
  %11 = load i32, ptr %retval, align 4
  ret i32 %11
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}

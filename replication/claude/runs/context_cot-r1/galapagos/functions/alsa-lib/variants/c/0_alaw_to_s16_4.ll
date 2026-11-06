; ModuleID = '/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/0_alaw_to_s16_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/0_alaw_to_s16_4.c"
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
  %a_val.addr = alloca i8, align 1
  %v = alloca i32, align 4
  %t = alloca i32, align 4
  %seg = alloca i32, align 4
  %i = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  %and = and i32 %xor, 255
  store i32 %and, ptr %v, align 4
  %1 = load i32, ptr %v, align 4
  %and1 = and i32 %1, 127
  store i32 %and1, ptr %t, align 4
  %2 = load i32, ptr %t, align 4
  %shr = ashr i32 %2, 4
  %and2 = and i32 %shr, 7
  store i32 %and2, ptr %seg, align 4
  %3 = load i32, ptr %seg, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i32, ptr %t, align 4
  %shl = shl i32 %4, 4
  %add = add nsw i32 %shl, 8
  store i32 %add, ptr %t, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %5 = load i32, ptr %t, align 4
  %and4 = and i32 %5, 15
  %shl5 = shl i32 %and4, 4
  %add6 = add nsw i32 %shl5, 264
  store i32 %add6, ptr %t, align 4
  store i32 1, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.else
  %6 = load i32, ptr %i, align 4
  %7 = load i32, ptr %seg, align 4
  %cmp7 = icmp slt i32 %6, %7
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load i32, ptr %t, align 4
  %9 = load i32, ptr %t, align 4
  %add9 = add nsw i32 %8, %9
  store i32 %add9, ptr %t, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, ptr %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  %11 = load i32, ptr %v, align 4
  %and10 = and i32 %11, 128
  %tobool = icmp ne i32 %and10, 0
  br i1 %tobool, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end
  %12 = load i32, ptr %t, align 4
  %sub = sub nsw i32 0, %12
  store i32 %sub, ptr %t, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end
  %13 = load i32, ptr %t, align 4
  ret i32 %13
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}

; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_8.c"
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
  %x = alloca i32, align 4
  %seg = alloca i32, align 4
  %shift = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %shr = ashr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %seg, align 4
  %2 = load i32, ptr %seg, align 4
  %cmp = icmp sgt i32 %2, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i32, ptr %seg, align 4
  %sub = sub nsw i32 %3, 1
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, ptr %shift, align 4
  %4 = load i32, ptr %x, align 4
  %and2 = and i32 %4, 15
  %5 = load i32, ptr %shift, align 4
  %add = add nsw i32 %5, 4
  %shl = shl i32 %and2, %add
  store i32 %shl, ptr %t, align 4
  %6 = load i32, ptr %shift, align 4
  %shl3 = shl i32 8, %6
  %7 = load i32, ptr %t, align 4
  %add4 = add nsw i32 %7, %shl3
  store i32 %add4, ptr %t, align 4
  %8 = load i32, ptr %seg, align 4
  %cmp5 = icmp sgt i32 %8, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %9 = load i32, ptr %shift, align 4
  %shl7 = shl i32 256, %9
  %10 = load i32, ptr %t, align 4
  %add8 = add nsw i32 %10, %shl7
  store i32 %add8, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %11 = load i32, ptr %x, align 4
  %and9 = and i32 %11, 128
  %tobool = icmp ne i32 %and9, 0
  br i1 %tobool, label %cond.true10, label %cond.false11

cond.true10:                                      ; preds = %if.end
  %12 = load i32, ptr %t, align 4
  br label %cond.end13

cond.false11:                                     ; preds = %if.end
  %13 = load i32, ptr %t, align 4
  %sub12 = sub nsw i32 0, %13
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false11, %cond.true10
  %cond14 = phi i32 [ %12, %cond.true10 ], [ %sub12, %cond.false11 ]
  ret i32 %cond14
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

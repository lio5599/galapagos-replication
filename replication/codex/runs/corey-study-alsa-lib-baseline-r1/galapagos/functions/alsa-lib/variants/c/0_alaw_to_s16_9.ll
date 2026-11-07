; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_9.c"
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
  %decoded = alloca i32, align 4
  %segment = alloca i32, align 4
  %mantissa = alloca i32, align 4
  %magnitude = alloca i32, align 4
  %scale = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %decoded, align 4
  %1 = load i32, ptr %decoded, align 4
  %shr = ashr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %segment, align 4
  %2 = load i32, ptr %decoded, align 4
  %and1 = and i32 %2, 15
  store i32 %and1, ptr %mantissa, align 4
  %3 = load i32, ptr %segment, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i32, ptr %mantissa, align 4
  %mul = mul nsw i32 %4, 16
  %add = add nsw i32 %mul, 8
  store i32 %add, ptr %magnitude, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %5 = load i32, ptr %segment, align 4
  %add3 = add nsw i32 %5, 3
  %shl = shl i32 1, %add3
  store i32 %shl, ptr %scale, align 4
  %6 = load i32, ptr %mantissa, align 4
  %7 = load i32, ptr %scale, align 4
  %mul4 = mul nsw i32 %6, %7
  %8 = load i32, ptr %scale, align 4
  %div = sdiv i32 %8, 2
  %add5 = add nsw i32 %mul4, %div
  %9 = load i32, ptr %segment, align 4
  %add6 = add nsw i32 %9, 7
  %shl7 = shl i32 1, %add6
  %add8 = add nsw i32 %add5, %shl7
  store i32 %add8, ptr %magnitude, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %10 = load i32, ptr %decoded, align 4
  %and9 = and i32 %10, 128
  %tobool = icmp ne i32 %and9, 0
  br i1 %tobool, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.end
  %11 = load i32, ptr %magnitude, align 4
  %sub = sub nsw i32 0, %11
  store i32 %sub, ptr %magnitude, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end
  %12 = load i32, ptr %magnitude, align 4
  ret i32 %12
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

; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %y = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, ptr %y, align 4
  %1 = load i32, ptr %y, align 4
  %sub = sub i32 %1, 26
  %shr = lshr i32 %sub, 8
  %and1 = and i32 %shr, 255
  store i32 %and1, ptr %a, align 4
  %2 = load i32, ptr %y, align 4
  %sub2 = sub i32 %2, 52
  %shr3 = lshr i32 %sub2, 8
  %and4 = and i32 %shr3, 255
  store i32 %and4, ptr %b, align 4
  %3 = load i32, ptr %y, align 4
  %sub5 = sub i32 %3, 62
  %shr6 = lshr i32 %sub5, 8
  %and7 = and i32 %shr6, 255
  store i32 %and7, ptr %c, align 4
  %4 = load i32, ptr %y, align 4
  %xor = xor i32 %4, 62
  %sub8 = sub i32 0, %xor
  %shr9 = lshr i32 %sub8, 8
  %and10 = and i32 %shr9, 255
  %xor11 = xor i32 %and10, 255
  store i32 %xor11, ptr %d, align 4
  %5 = load i32, ptr %y, align 4
  %xor12 = xor i32 %5, 63
  %sub13 = sub i32 0, %xor12
  %shr14 = lshr i32 %sub13, 8
  %and15 = and i32 %shr14, 255
  %xor16 = xor i32 %and15, 255
  store i32 %xor16, ptr %e, align 4
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %y, align 4
  %add = add i32 %7, 65
  %and17 = and i32 %6, %add
  %8 = load i32, ptr %a, align 4
  %xor18 = xor i32 255, %8
  %9 = load i32, ptr %b, align 4
  %and19 = and i32 %xor18, %9
  %10 = load i32, ptr %y, align 4
  %add20 = add i32 %10, 71
  %and21 = and i32 %and19, %add20
  %or = or i32 %and17, %and21
  %11 = load i32, ptr %b, align 4
  %xor22 = xor i32 255, %11
  %12 = load i32, ptr %c, align 4
  %and23 = and i32 %xor22, %12
  %13 = load i32, ptr %y, align 4
  %add24 = add i32 %13, -4
  %and25 = and i32 %and23, %add24
  %or26 = or i32 %or, %and25
  %14 = load i32, ptr %d, align 4
  %and27 = and i32 %14, 45
  %or28 = or i32 %or26, %and27
  %15 = load i32, ptr %e, align 4
  %and29 = and i32 %15, 95
  %or30 = or i32 %or28, %and29
  ret i32 %or30
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

; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_5.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, ptr %x.addr, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %1, 26
  %shr = lshr i32 %sub, 8
  %and1 = and i32 %shr, 255
  store i32 %and1, ptr %a, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub2 = sub i32 %2, 52
  %shr3 = lshr i32 %sub2, 8
  %and4 = and i32 %shr3, 255
  store i32 %and4, ptr %b, align 4
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add = add i32 %4, 65
  %and5 = and i32 %3, %add
  store i32 %and5, ptr %result, align 4
  %5 = load i32, ptr %a, align 4
  %xor = xor i32 %5, 255
  %6 = load i32, ptr %b, align 4
  %and6 = and i32 %xor, %6
  %7 = load i32, ptr %x.addr, align 4
  %add7 = add i32 %7, 71
  %and8 = and i32 %and6, %add7
  %8 = load i32, ptr %result, align 4
  %or = or i32 %8, %and8
  store i32 %or, ptr %result, align 4
  %9 = load i32, ptr %b, align 4
  %xor9 = xor i32 %9, 255
  %10 = load i32, ptr %x.addr, align 4
  %sub10 = sub i32 %10, 62
  %shr11 = lshr i32 %sub10, 8
  %and12 = and i32 %shr11, 255
  %and13 = and i32 %xor9, %and12
  %11 = load i32, ptr %x.addr, align 4
  %add14 = add i32 %11, -4
  %and15 = and i32 %and13, %add14
  %12 = load i32, ptr %result, align 4
  %or16 = or i32 %12, %and15
  store i32 %or16, ptr %result, align 4
  %13 = load i32, ptr %x.addr, align 4
  %xor17 = xor i32 %13, 62
  %sub18 = sub i32 0, %xor17
  %shr19 = lshr i32 %sub18, 8
  %and20 = and i32 %shr19, 255
  %xor21 = xor i32 %and20, 255
  %and22 = and i32 %xor21, 45
  %14 = load i32, ptr %result, align 4
  %or23 = or i32 %14, %and22
  store i32 %or23, ptr %result, align 4
  %15 = load i32, ptr %x.addr, align 4
  %xor24 = xor i32 %15, 63
  %sub25 = sub i32 0, %xor24
  %shr26 = lshr i32 %sub25, 8
  %and27 = and i32 %shr26, 255
  %xor28 = xor i32 %and27, 255
  %and29 = and i32 %xor28, 95
  %16 = load i32, ptr %result, align 4
  %or30 = or i32 %16, %and29
  store i32 %or30, ptr %result, align 4
  %17 = load i32, ptr %result, align 4
  ret i32 %17
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

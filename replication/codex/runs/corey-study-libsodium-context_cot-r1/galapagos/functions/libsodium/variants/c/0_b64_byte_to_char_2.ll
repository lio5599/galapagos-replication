; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/0_b64_byte_to_char_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/0_b64_byte_to_char_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %t0 = alloca i32, align 4
  %t1 = alloca i32, align 4
  %t2 = alloca i32, align 4
  %t3 = alloca i32, align 4
  %t4 = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  store i32 %shr, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  store i32 %shr2, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub3 = sub i32 %2, 62
  %shr4 = lshr i32 %sub3, 8
  store i32 %shr4, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub5 = sub i32 0, %xor
  %shr6 = lshr i32 %sub5, 8
  store i32 %shr6, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor7 = xor i32 %4, 63
  %sub8 = sub i32 0, %xor7
  %shr9 = lshr i32 %sub8, 8
  store i32 %shr9, ptr %e, align 4
  %5 = load i32, ptr %a, align 4
  %not = xor i32 %5, -1
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %not10 = xor i32 %add, -1
  %or = or i32 %not, %not10
  %not11 = xor i32 %or, -1
  store i32 %not11, ptr %t0, align 4
  %7 = load i32, ptr %a, align 4
  %8 = load i32, ptr %b, align 4
  %not12 = xor i32 %8, -1
  %or13 = or i32 %7, %not12
  %9 = load i32, ptr %x.addr, align 4
  %add14 = add i32 %9, 71
  %not15 = xor i32 %add14, -1
  %or16 = or i32 %or13, %not15
  %not17 = xor i32 %or16, -1
  store i32 %not17, ptr %t1, align 4
  %10 = load i32, ptr %b, align 4
  %11 = load i32, ptr %c, align 4
  %not18 = xor i32 %11, -1
  %or19 = or i32 %10, %not18
  %12 = load i32, ptr %x.addr, align 4
  %add20 = add i32 %12, -4
  %not21 = xor i32 %add20, -1
  %or22 = or i32 %or19, %not21
  %not23 = xor i32 %or22, -1
  store i32 %not23, ptr %t2, align 4
  %13 = load i32, ptr %d, align 4
  %or24 = or i32 %13, -44
  %not25 = xor i32 %or24, -1
  store i32 %not25, ptr %t3, align 4
  %14 = load i32, ptr %e, align 4
  %or26 = or i32 %14, -48
  %not27 = xor i32 %or26, -1
  store i32 %not27, ptr %t4, align 4
  %15 = load i32, ptr %t0, align 4
  %16 = load i32, ptr %t1, align 4
  %or28 = or i32 %15, %16
  %17 = load i32, ptr %t2, align 4
  %or29 = or i32 %or28, %17
  %18 = load i32, ptr %t3, align 4
  %or30 = or i32 %or29, %18
  %19 = load i32, ptr %t4, align 4
  %or31 = or i32 %or30, %19
  %and = and i32 %or31, 255
  ret i32 %and
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

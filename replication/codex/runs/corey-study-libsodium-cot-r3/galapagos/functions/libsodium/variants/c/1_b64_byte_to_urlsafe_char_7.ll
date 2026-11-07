; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_7.c"
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
  %first = alloca i32, align 4
  %second = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %add = add i32 %2, 65
  %and4 = and i32 %add, 255
  store i32 %and4, ptr %first, align 4
  %3 = load i32, ptr %b, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add5 = add i32 %4, 71
  %and6 = and i32 %3, %add5
  store i32 %and6, ptr %second, align 4
  %5 = load i32, ptr %second, align 4
  %6 = load i32, ptr %first, align 4
  %7 = load i32, ptr %second, align 4
  %xor = xor i32 %6, %7
  %8 = load i32, ptr %a, align 4
  %and7 = and i32 %xor, %8
  %xor8 = xor i32 %5, %and7
  store i32 %xor8, ptr %result, align 4
  %9 = load i32, ptr %b, align 4
  %xor9 = xor i32 255, %9
  %10 = load i32, ptr %x.addr, align 4
  %sub10 = sub i32 %10, 62
  %shr11 = lshr i32 %sub10, 8
  %and12 = and i32 %shr11, 255
  %and13 = and i32 %xor9, %and12
  %11 = load i32, ptr %x.addr, align 4
  %add14 = add i32 %11, -4
  %and15 = and i32 %and13, %add14
  %12 = load i32, ptr %result, align 4
  %or = or i32 %12, %and15
  store i32 %or, ptr %result, align 4
  %13 = load i32, ptr %x.addr, align 4
  %xor16 = xor i32 %13, 62
  %sub17 = sub i32 0, %xor16
  %shr18 = lshr i32 %sub17, 8
  %and19 = and i32 %shr18, 255
  %xor20 = xor i32 255, %and19
  %and21 = and i32 %xor20, 45
  %14 = load i32, ptr %result, align 4
  %or22 = or i32 %14, %and21
  store i32 %or22, ptr %result, align 4
  %15 = load i32, ptr %x.addr, align 4
  %xor23 = xor i32 %15, 63
  %sub24 = sub i32 0, %xor23
  %shr25 = lshr i32 %sub24, 8
  %and26 = and i32 %shr25, 255
  %xor27 = xor i32 255, %and26
  %and28 = and i32 %xor27, 95
  %16 = load i32, ptr %result, align 4
  %or29 = or i32 %16, %and28
  store i32 %or29, ptr %result, align 4
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

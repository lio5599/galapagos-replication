; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.c"
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
  %result = alloca i32, align 4
  %mask_lo = alloca i32, align 4
  %mask_mid = alloca i32, align 4
  %mask_hi = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  store i32 0, ptr %result, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %mask_lo, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %mask_mid, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %mask_hi, align 4
  %3 = load i32, ptr %mask_lo, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add = add i32 %4, 65
  %and7 = and i32 %3, %add
  %5 = load i32, ptr %result, align 4
  %or = or i32 %5, %and7
  store i32 %or, ptr %result, align 4
  %6 = load i32, ptr %mask_lo, align 4
  %xor = xor i32 %6, 255
  %7 = load i32, ptr %mask_mid, align 4
  %and8 = and i32 %xor, %7
  %8 = load i32, ptr %x.addr, align 4
  %add9 = add i32 %8, 71
  %and10 = and i32 %and8, %add9
  %9 = load i32, ptr %result, align 4
  %or11 = or i32 %9, %and10
  store i32 %or11, ptr %result, align 4
  %10 = load i32, ptr %mask_mid, align 4
  %xor12 = xor i32 %10, 255
  %11 = load i32, ptr %mask_hi, align 4
  %and13 = and i32 %xor12, %11
  %12 = load i32, ptr %x.addr, align 4
  %sub14 = sub i32 %12, 4
  %and15 = and i32 %and13, %sub14
  %13 = load i32, ptr %result, align 4
  %or16 = or i32 %13, %and15
  store i32 %or16, ptr %result, align 4
  %14 = load i32, ptr %x.addr, align 4
  %xor17 = xor i32 %14, 62
  %sub18 = sub i32 0, %xor17
  %shr19 = lshr i32 %sub18, 8
  %and20 = and i32 %shr19, 255
  %xor21 = xor i32 %and20, 255
  %and22 = and i32 %xor21, 45
  %15 = load i32, ptr %result, align 4
  %or23 = or i32 %15, %and22
  store i32 %or23, ptr %result, align 4
  %16 = load i32, ptr %x.addr, align 4
  %xor24 = xor i32 %16, 63
  %sub25 = sub i32 0, %xor24
  %shr26 = lshr i32 %sub25, 8
  %and27 = and i32 %shr26, 255
  %xor28 = xor i32 %and27, 255
  %and29 = and i32 %xor28, 95
  %17 = load i32, ptr %result, align 4
  %or30 = or i32 %17, %and29
  store i32 %or30, ptr %result, align 4
  %18 = load i32, ptr %result, align 4
  ret i32 %18
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

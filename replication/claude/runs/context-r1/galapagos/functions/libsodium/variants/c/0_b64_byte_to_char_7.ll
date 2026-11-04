; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_7.c"
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
  %m26 = alloca i32, align 4
  %m52 = alloca i32, align 4
  %m62 = alloca i32, align 4
  %e62 = alloca i32, align 4
  %e63 = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %conv = trunc i32 %shr to i8
  %conv1 = zext i8 %conv to i32
  store i32 %conv1, ptr %m26, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub2 = sub i32 %1, 52
  %shr3 = lshr i32 %sub2, 8
  %conv4 = trunc i32 %shr3 to i8
  %conv5 = zext i8 %conv4 to i32
  store i32 %conv5, ptr %m52, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub6 = sub i32 %2, 62
  %shr7 = lshr i32 %sub6, 8
  %conv8 = trunc i32 %shr7 to i8
  %conv9 = zext i8 %conv8 to i32
  store i32 %conv9, ptr %m62, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub10 = sub i32 0, %xor
  %shr11 = lshr i32 %sub10, 8
  %not = xor i32 %shr11, -1
  %conv12 = trunc i32 %not to i8
  %conv13 = zext i8 %conv12 to i32
  store i32 %conv13, ptr %e62, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor14 = xor i32 %4, 63
  %sub15 = sub i32 0, %xor14
  %shr16 = lshr i32 %sub15, 8
  %not17 = xor i32 %shr16, -1
  %conv18 = trunc i32 %not17 to i8
  %conv19 = zext i8 %conv18 to i32
  store i32 %conv19, ptr %e63, align 4
  %5 = load i32, ptr %m26, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and = and i32 %5, %add
  %7 = load i32, ptr %m26, align 4
  %xor20 = xor i32 %7, 255
  %8 = load i32, ptr %m52, align 4
  %and21 = and i32 %xor20, %8
  %9 = load i32, ptr %x.addr, align 4
  %add22 = add i32 %9, 71
  %and23 = and i32 %and21, %add22
  %or = or i32 %and, %and23
  %10 = load i32, ptr %m52, align 4
  %xor24 = xor i32 %10, 255
  %11 = load i32, ptr %m62, align 4
  %and25 = and i32 %xor24, %11
  %12 = load i32, ptr %x.addr, align 4
  %sub26 = sub i32 %12, 4
  %and27 = and i32 %and25, %sub26
  %or28 = or i32 %or, %and27
  %13 = load i32, ptr %e62, align 4
  %and29 = and i32 %13, 43
  %or30 = or i32 %or28, %and29
  %14 = load i32, ptr %e63, align 4
  %and31 = and i32 %14, 47
  %or32 = or i32 %or30, %and31
  ret i32 %or32
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
